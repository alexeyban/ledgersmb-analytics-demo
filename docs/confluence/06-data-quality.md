# 06 — Data quality: tests, invariants and an independent oracle

Data quality is enforced at four levels. Each has been **shown to fail** on a planted defect, because
a check that has only ever passed proves nothing.

| Level | What | Where | Result | Negative check |
|---|---|---|---|---|
| 1. Migration | EKOS V1 (counts) / V2 (column aggregates) / V3 (row hashes) | `ekos migrate validate` | 30/30 | +0.01 on one journal line in ClickHouse → **V3 failed**, exit 1 |
| 2. Structure | dbt generic tests: unique, not-null, relationships, accepted values, non-negative, row count vs source | `dbt/models/**/_*.yml` | 114/114 | — |
| 3. Accounting invariants | dbt singular tests (below) | `dbt/tests/` | 10/10 | +10.00 on one Sales line in `lsmb_raw` → **2 tests failed**, 24 downstream nodes skipped |
| 4. Independent oracle | marts vs **LedgerSMB's own reports** in PostgreSQL | `pipelines/lsmb_pipelines/reconcile.py` | 6/6 | stale target (PG regenerated, CH not reloaded) → **6/6 failed** |

## The accounting invariants (dbt singular tests)

| Test | Invariant |
|---|---|
| `assert_every_transaction_balances` | Double entry: each transaction's debits = credits |
| `assert_trial_balance_debits_equal_credits` | Each month's period debits = period credits |
| `assert_balance_sheet_balances` | Assets = liabilities + equity (earnings to date explicit), every month-end |
| `assert_ar_subledger_ties_to_gl` | Σ open AR items = AR control account (1200) at the as-of date |
| `assert_ap_subledger_ties_to_gl` | Σ open AP items = AP control account (2100) |
| `assert_sales_revenue_ties_to_gl` | Σ line revenue = Sales (4010) |
| `assert_sales_cogs_ties_to_gl` | Σ FIFO COGS on sales lines = COGS (5010) on sales transactions |
| `assert_inventory_value_ties_to_gl` | Stock at last cost = Inventory (1510). Exact here because costs are constant per part; with changing costs this becomes a FIFO-layer check |
| `assert_inventory_movements_reconstruct_on_hand` | Receipts − sales + count adjustments reproduce LedgerSMB's `parts.onhand` per part |
| `assert_stock_variance_posted_to_gl` | Count variance value = inventory-adjustment postings |

## Generic tests worth noting

* `equal_rowcount_to_source` (custom): every staging model has exactly as many rows as its raw
  table. It catches a join that silently drops or duplicates rows.
* `expression_is_true` (custom): e.g. a journal line is never both a debit and a credit, and an
  invoice's due date is never before its invoice date.
* `non_negative` (custom): quantities, amounts and on-hand never go below zero.

## The independent oracle

dbt tests check the model against itself. `reconcile.py` checks it against **LedgerSMB's own
reporting functions**, executed in PostgreSQL:

| Check | LedgerSMB function | Compared | Result |
|---|---|---|---|
| Trial balance at 2026-06-30 | `trial_balance__generate` | 66 accounts | exact |
| Income statement 2025-01..2026-06 | `pnl__income_statement_accrual` | 10 accounts | exact |
| Balance sheet | `report__balance_sheet(…, 'ultimo')` | 19 accounts | exact |
| AR open items | the AR control account in `acc_trans` | 371 items | exact |
| Stock on hand | `parts.onhand` | 108 parts | exact |
| Raw row counts | `count(*)` | 31 tables | exact |

Two presentation conventions had to be matched rather than "fixed". LedgerSMB's statement functions
return heading **subtotal rows** (`account_type = 'H'`) alongside accounts, and its balance sheet
reports every line in **raw ledger sign** (credit positive), income and expense accounts included,
because there is no year-end close.

LedgerSMB's own **aging** reports (`report__invoice_aging_summary` / `_detail`) fail on this 1.14
development schema, so AR is reconciled against the open-item ledger directly (see 08).
