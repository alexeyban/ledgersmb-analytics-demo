"""Render the headline KPIs from the ClickHouse marts as Markdown (``docs/confluence/05-kpis.md``).

Every number on that page is a query result from this run. The page carries the query next to each
table, so a reader can re-run it rather than trust it. Also writes ``logs/kpis.json`` for the
presentation.
"""

from __future__ import annotations

import json
from datetime import datetime, timezone
from decimal import Decimal

from .config import LOGS, ROOT, clickhouse, settings

OUT = ROOT / "docs" / "confluence" / "05-kpis.md"

QUERIES = {
    "pnl_total": (
        "Profit & loss, whole period",
        # Output aliases differ from the column names: ClickHouse lets an alias shadow a column, so
        # `sum(revenue) AS revenue` reused later would nest one aggregate inside another.
        "SELECT sum(revenue) AS total_revenue, sum(cost_of_goods_sold) AS total_cogs, "
        "sum(gross_profit) AS total_gross_profit, "
        "round(sum(gross_profit) / sum(revenue) * 100, 1) AS gross_margin_pct, "
        "sum(payroll_expense) AS total_payroll, sum(general_admin_expense) AS total_general_admin, "
        "sum(net_income) AS total_net_income, round(sum(net_income) / sum(revenue) * 100, 1) AS net_margin_pct "
        "FROM {db}.mart_income_statement_monthly",
    ),
    "pnl_monthly": (
        "Monthly P&L",
        "SELECT formatDateTime(month_start, '%Y-%m') AS month, revenue, cost_of_goods_sold AS cogs, "
        "gross_margin_pct, net_income, net_margin_pct FROM {db}.mart_income_statement_monthly ORDER BY month_start",
    ),
    "balance_sheet": (
        "Balance sheet at period end",
        "SELECT month_end, total_assets, total_liabilities, contributed_equity, retained_earnings_to_date, "
        "total_liabilities_and_equity FROM {db}.mart_balance_sheet_monthly ORDER BY month_end DESC LIMIT 1",
    ),
    "working_capital": (
        "Working capital (last 6 months)",
        "SELECT formatDateTime(month_start, '%Y-%m') AS month, accounts_receivable, accounts_payable, inventory, "
        "dso_days, dpo_days, dio_days FROM {db}.mart_working_capital_monthly ORDER BY month_start DESC LIMIT 6",
    ),
    "ar_aging": (
        "Receivables aging (as of 2026-06-30)",
        "SELECT sum(total_open) AS open, sum(not_yet_due) AS not_due, sum(past_due_1_30) AS d1_30, "
        "sum(past_due_31_60) AS d31_60, sum(past_due_61_90) AS d61_90, sum(past_due_over_90) AS d90_plus "
        "FROM {db}.mart_ar_aging",
    ),
    "worst_debtors": (
        "Customers with the most overdue receivables",
        "SELECT customer_name, segment, total_open, past_due_31_60 + past_due_61_90 + past_due_over_90 AS over_30, "
        "oldest_days_past_due FROM {db}.mart_ar_aging ORDER BY over_30 DESC, total_open DESC LIMIT 8",
    ),
    "cash_flow": (
        "Cash flow, whole period",
        "SELECT sum(receipts_from_customers) AS receipts, sum(payments_to_suppliers) AS suppliers, "
        "sum(payroll_paid) AS payroll, sum(capital_expenditure) AS capex, sum(financing) AS financing, "
        "sum(other_operating) AS other, sum(net_cash_flow) AS net FROM {db}.mart_cash_flow_monthly",
    ),
    "part_groups": (
        "Product groups: revenue and margin",
        "SELECT part_group, sum(revenue) AS group_revenue, sum(gross_margin) AS group_margin, "
        "round(sum(gross_margin) / sum(revenue) * 100, 1) AS margin_pct, sum(quantity_sold) AS units "
        "FROM {db}.mart_sales_by_part_group_monthly GROUP BY part_group ORDER BY group_revenue DESC",
    ),
    "top_customers": (
        "Top customers by revenue",
        "SELECT customer_name, segment, revenue, gross_margin_pct, avg_days_to_pay, open_receivables "
        "FROM {db}.mart_customer_profitability ORDER BY revenue_rank LIMIT 10",
    ),
    "abc": (
        "ABC classification (trailing 12 months)",
        "SELECT abc_class, count() AS parts, sum(revenue_12m) AS class_revenue, "
        "round(sum(revenue_12m) / (SELECT sum(revenue_12m) FROM {db}.mart_abc_analysis) * 100, 1) AS share_pct "
        "FROM {db}.mart_abc_analysis GROUP BY abc_class ORDER BY abc_class",
    ),
    "inventory": (
        "Inventory position",
        "SELECT count() AS stocked_parts, sum(inventory_value) AS value, countIf(below_reorder_point) AS below_rop, "
        "round(avgIf(days_of_supply, days_of_supply IS NOT NULL), 1) AS avg_days_of_supply "
        "FROM {db}.mart_inventory_position",
    ),
    "reorder_now": (
        "Parts below reorder point",
        "SELECT part_number, part_group, on_hand_quantity, reorder_point, days_of_supply "
        "FROM {db}.mart_inventory_position WHERE below_reorder_point ORDER BY days_of_supply ASC NULLS LAST LIMIT 10",
    ),
    "shrinkage": (
        "Stock-count variance (shrinkage)",
        "SELECT count_date, sum(parts_counted) AS counted, sum(parts_with_variance) AS with_variance, "
        "sum(variance_quantity) AS units, sum(variance_value) AS value "
        "FROM {db}.mart_stock_count_variance GROUP BY count_date ORDER BY count_date",
    ),
    "backlog": (
        "Open sales-order backlog",
        "SELECT count() AS open_orders, sum(net_amount) AS value, countIf(is_late) AS late, "
        "round(avg(age_days), 1) AS avg_age_days FROM {db}.mart_order_backlog",
    ),
    "suppliers": (
        "Top suppliers by spend",
        "SELECT vendor_name, sum(spend) AS total_spend, sum(purchase_invoices) AS invoices "
        "FROM {db}.mart_supplier_spend_monthly GROUP BY vendor_name ORDER BY total_spend DESC LIMIT 8",
    ),
}


def _fmt(v) -> str:
    if isinstance(v, (Decimal, float)):
        return f"{v:,.2f}"
    if isinstance(v, int) and not isinstance(v, bool):
        return f"{v:,}"
    return str(v)


def main() -> dict:
    s = settings()
    ch = clickhouse()
    data: dict = {}
    md = [
        "# 05 — Key figures",
        "",
        "> Generated by `pipelines/lsmb_pipelines/kpi_report.py` from the ClickHouse marts, "
        f"{datetime.now(timezone.utc):%Y-%m-%d %H:%M} UTC. Every table shows the query that produced it.",
        "> **Synthetic data** — Harbor Mill Supply Co. is a simulated company (see 01-overview).",
        "",
    ]
    for key, (title, sql) in QUERIES.items():
        q = ch.query(sql.format(db=s.analytics_db))
        cols, rows = q.column_names, q.result_rows
        data[key] = {"title": title, "columns": list(cols),
                     "rows": [[str(v) if isinstance(v, Decimal) else v for v in r] for r in rows]}
        md += [f"## {title}", "", "| " + " | ".join(cols) + " |",
               "|" + "---|" * len(cols)]
        md += ["| " + " | ".join(_fmt(v) for v in r) + " |" for r in rows]
        md += ["", "<details><summary>Query</summary>", "", "```sql",
               sql.format(db=s.analytics_db), "```", "", "</details>", ""]
    OUT.parent.mkdir(parents=True, exist_ok=True)
    OUT.write_text("\n".join(md))
    (LOGS / "kpis.json").write_text(json.dumps(data, indent=2, default=str))
    return {"sections": len(QUERIES), "page": str(OUT)}


if __name__ == "__main__":
    print(main())
