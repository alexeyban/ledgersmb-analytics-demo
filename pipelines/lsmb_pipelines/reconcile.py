"""Reconcile the ClickHouse marts against LedgerSMB's OWN reports, run inside PostgreSQL.

dbt's tests check the analytical layer against itself (debits = credits, subledger = control
account…). This module checks it against an **independent oracle**: the reporting functions
LedgerSMB itself ships (``sql/modules/trial_balance.sql``, ``FinStatements.sql``), executed on the
source database. If the marts and LedgerSMB agree account by account, the migration, the staging
sign conventions and the mart arithmetic are all right at once.

Checks (all to the cent, per account):

1. Trial balance at the as-of date — ``trial_balance__generate`` vs ``mart_trial_balance_monthly``.
2. Accrual income statement for the period — ``pnl__income_statement_accrual`` vs the income and
   expense accounts of ``fct_journal_lines``.
3. Balance sheet — ``report__balance_sheet(…, 'ultimo')`` vs month-end closing balances.
4. AR open items — per open item, PostgreSQL ``acc_trans`` vs ``int_open_item_balances``.
5. Stock on hand — ``parts.onhand`` vs ``dim_part``.
6. Raw row counts — every migrated table, PostgreSQL vs ``lsmb_raw``.

LedgerSMB's own aging reports (``report__invoice_aging_summary`` / ``_detail``) fail on this 1.14
development schema ("structure of query does not match function result type" / "column id specified
in USING clause does not exist"), so check 4 uses the open-item ledger directly. That is an upstream
LedgerSMB finding, not a demo workaround.

Writes ``logs/reconciliation.json``; exits non-zero if any check fails.
"""

from __future__ import annotations

import json
import sys
from decimal import Decimal

import psycopg

from .config import LOGS, clickhouse, settings

FROM, TO = "2025-01-01", "2026-06-30"


def _by_account(rows) -> dict[str, Decimal]:
    return {r[0]: Decimal(str(r[1])).quantize(Decimal("0.01")) for r in rows}


def _compare(name: str, oracle: dict, mart: dict, note: str) -> dict:
    keys = sorted(set(oracle) | set(mart))
    diffs = [
        {"key": k, "ledgersmb": str(oracle.get(k, Decimal(0))), "mart": str(mart.get(k, Decimal(0)))}
        for k in keys
        if oracle.get(k, Decimal(0)) != mart.get(k, Decimal(0))
    ]
    return {"check": name, "compared": len(keys), "differences": diffs, "passed": not diffs,
            "oracle": note}


def main() -> int:
    s = settings()
    ch = clickhouse()
    results = []
    with psycopg.connect(s.pg_dsn) as pg:
        # 1. trial balance
        tb = _by_account(pg.execute(
            "SELECT account_number, ending_balance FROM trial_balance__generate(%s, %s, NULL, NULL, "
            "NULL, NULL, true, true)", (FROM, TO)).fetchall())
        mart_tb = _by_account(ch.query(
            f"SELECT account_number, closing_balance FROM {s.analytics_db}.mart_trial_balance_monthly "
            f"WHERE month_end = toDate('{TO}')").result_rows)
        results.append(_compare("trial balance", tb, mart_tb, "trial_balance__generate()"))

        # 2. accrual income statement (LedgerSMB: income +, expense −)
        pnl = _by_account(pg.execute(
            # account_type 'A' = an account; 'H' rows are heading subtotals (4000 SALES REVENUE…).
            "SELECT account_number, amount FROM pnl__income_statement_accrual(%s, %s, NULL, 'en') "
            "WHERE account_type = 'A'", (FROM, TO)).fetchall())
        mart_pnl = _by_account(ch.query(
            f"SELECT account_number, sum(if(account_category = 'I', natural_amount, -natural_amount)) "
            f"FROM {s.analytics_db}.fct_journal_lines WHERE account_category IN ('I', 'E') "
            f"AND posting_date BETWEEN toDate('{FROM}') AND toDate('{TO}') "
            f"GROUP BY account_number").result_rows)
        results.append(_compare("income statement (accrual)", pnl, mart_pnl,
                                "pnl__income_statement_accrual()"))

        # 3. balance sheet. LedgerSMB's function reports every line in raw ledger sign (credit
        #    positive), so debit-normal lines (assets, and expenses — with no year-end close the
        #    report carries income and expense accounts as current earnings) come back negative;
        #    flip them to the natural sign the marts use. Heading rows ('H') are subtotals.
        bs = _by_account(pg.execute(
            "SELECT account_number, CASE WHEN account_category IN ('A', 'E') THEN -amount ELSE amount END "
            "FROM report__balance_sheet(%s, 'en', 'ultimo') WHERE account_type = 'A'",
            (TO,)).fetchall())
        mart_bs = _by_account(ch.query(
            f"SELECT account_number, closing_balance FROM {s.analytics_db}.mart_trial_balance_monthly "
            f"WHERE month_end = toDate('{TO}') AND closing_balance != 0").result_rows)
        results.append(_compare("balance sheet", bs, mart_bs, "report__balance_sheet(…, 'ultimo')"))

        # 4. AR open items
        oi = _by_account(pg.execute(
            "SELECT a.open_item_id::text, -sum(a.amount_bc) FROM acc_trans a "
            "JOIN account c ON c.id = a.chart_id WHERE c.accno = '1200' AND a.transdate <= %s "
            "GROUP BY 1 HAVING sum(a.amount_bc) <> 0", (TO,)).fetchall())
        mart_oi = _by_account(ch.query(
            f"SELECT toString(open_item_id), open_balance FROM {s.analytics_db}.int_open_item_balances "
            f"WHERE ledger = 'AR' AND open_balance != 0").result_rows)
        results.append(_compare("AR open items", oi, mart_oi, "acc_trans on the AR control account"))

        # 5. stock on hand
        onhand = _by_account(pg.execute(
            "SELECT partnumber, onhand FROM parts WHERE inventory_accno_id IS NOT NULL").fetchall())
        mart_onhand = _by_account(ch.query(
            f"SELECT part_number, on_hand_quantity FROM {s.analytics_db}.dim_part WHERE is_stocked"
        ).result_rows)
        results.append(_compare("stock on hand", onhand, mart_onhand, "parts.onhand"))

        # 6. raw row counts
        tables = [r[0] for r in ch.query(
            f"SELECT name FROM system.tables WHERE database = '{s.raw_db}'").result_rows]
        counts_pg = {t: Decimal(pg.execute(f'SELECT count(*) FROM public."{t}"').fetchone()[0])
                     for t in tables}
        counts_ch = {t: Decimal(ch.query(f"SELECT count() FROM {s.raw_db}.`{t}`").result_rows[0][0])
                     for t in tables}
        results.append(_compare("raw row counts", counts_pg, counts_ch, "count(*) per table"))

    out = {"period": [FROM, TO], "checks": results,
           "passed": all(r["passed"] for r in results)}
    (LOGS / "reconciliation.json").write_text(json.dumps(out, indent=2))
    for r in results:
        print(f"{'PASS' if r['passed'] else 'FAIL'}  {r['check']:<28} {r['compared']:>5} compared, "
              f"{len(r['differences'])} different  (oracle: {r['oracle']})")
    return 0 if out["passed"] else 1


if __name__ == "__main__":
    sys.exit(main())
