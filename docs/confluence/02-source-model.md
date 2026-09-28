# 02 — The LedgerSMB source model (what the analytics rests on)

Every fact on this page was **established from evidence, not assumed**. The *Source* column says how:
**EKOS** (a compiled-knowledge query, logged in `logs/ekos_queries.jsonl`), **LedgerSMB source** (a
file in the LedgerSMB repository, read and cited), or **measured** (a query on the loaded database).

## The tables that matter for finance and materials

EKOS located all 24 core tables in its compiled model of the repository (185 tables in total, found
with `FIND Object WHERE kind = 'Table' AND name = '…'`), then returned each one's columns, keys,
`COMMENT ON` text and relationships.

| Area | Tables | Role |
|---|---|---|
| General ledger | `transactions`, `acc_trans`, `gl`, `account`, `account_heading`, `account_link` | Transaction headers, journal lines, chart of accounts |
| Receivables / payables | `ar`, `ap`, `open_item`, `payment`, `entity_credit_account`, `company`, `entity` | Documents, open items, settlements, counterparties |
| Materials | `parts`, `partsgroup`, `invoice`, `inventory_report`, `inventory_report_line`, `warehouse` | Items, invoice lines (goods movements), stock counts |
| Orders | `oe`, `orderitems`, `oe_class` | Sales/purchase orders and quotations |
| Tax / reference | `tax`, `partstax`, `trans_type`, `currency`, `country`, `business` | Rates, codes, segments |

## Rules the model depends on

| # | Rule | Source |
|---|---|---|
| R1 | **`acc_trans.amount_bc`: negative = debit, positive = credit.** One signed amount per line. | LedgerSMB source: `sql/modules/trial_balance.sql` (`amount_bc < 0 THEN amount_bc * -1` is the debit column) |
| R2 | `gl`, `ar`, `ap` hang off one `transactions` header (id = `trans_id`); the date lives on the header. | measured: `\d` of the loaded schema, after `sql/changes/1.14/non-gl-transactions.sql` |
| R3 | **COGS is FIFO, computed in the database**: `cogs__add_for_ar_line(invoice_id)` allocates against purchase lines and posts *Dr COGS / Cr Inventory*, tagging those journal lines with the sales-invoice line. | EKOS (cloud `ekos ask`, FIFO) + LedgerSMB source: `sql/modules/COGS.sql` + measured: 9,322 of 9,322 goods lines carry the tag |
| R4 | Invoice quantity is signed by direction: **positive on sales, negative on purchases.** | LedgerSMB source: `sql/modules/COGS.sql` (`IF t_inv.qty < 0 THEN -- normal COGS` in the AP path) |
| R5 | **AR/AP are open-item managed**: every line on the AR/AP accounts carries an `open_item_id`; payments settle open items. | LedgerSMB source: `trigger_open_item_maintenance()`; `payment_post()` in `sql/modules/Payment.sql` |
| R6 | Customer vs vendor is `entity_credit_account.entity_class` (1 = vendor, 2 = customer). | EKOS (cloud `ekos ask` located the column) + measured: `entity_class` table rows |
| R7 | `parts` with an inventory account are stocked goods; without one, services (no COGS). | LedgerSMB source: `cogs__add_for_ar_line` returns 0 when `inventory_accno_id IS NULL` |
| R8 | Transaction and line ids are identity columns since LedgerSMB 1.12; the old `id` sequence is gone. | measured (generator failure `relation "id" does not exist`) + `sql/changes/1.12/migrate_to_identity.sql` |
| R9 | `tax.validto = 'infinity'` means "no end date". | measured + EKOS finding `COMPAT.CH.INFINITE_TIMESTAMP` |

## What EKOS's answers were worth, honestly

| Question | EKOS structural tools (MCP, no LLM) | EKOS `ekos ask` (LLM over evidence) |
|---|---|---|
| Where are the core tables? | ✅ all 24 found | — |
| Columns and comments of `acc_trans` | ✅ incl. `COMMENT ON` text with file:line | — |
| What depends on `parts`? | ✅ `ekos_dependents` / migrate blast radius: 27 | ❌ "insufficient evidence" (cloud) / wrong (local) |
| How is COGS computed? | — | ✅ FIFO (cloud); no line-level detail claimed |
| How are debits/credits stored? | — | ⚠️ pointed at `journal_line`, a newer table the posting path used here does not write; did not state the sign rule |
| How is a count variance posted? | — | ❌ "insufficient evidence" |

**Takeaway:** the compiled, structural answers were exact and fast. The LLM answers were cautious,
refusing rather than inventing, which is the right failure mode, but they were not enough on their
own to design from. Every rule above that the analytics depends on was confirmed in LedgerSMB's
source or measured on the database.

## Drift: repository vs deployed schema

`ekos migrate discover` compared EKOS's compiled view of the repository with the live catalog and
recorded **316 drift findings**: 246 columns live-only, 51 columns repo-only, 1 table live-only and
18 tables repo-only. 298 of them change what a migration would produce. The typical case is
`acc_trans.amount` in the repository's base DDL, which became `amount_bc` + `amount_tc` in a later
`sql/changes/` script. Most of this drift is real history, but part of it is an EKOS limitation: EKOS
compiles the base `CREATE TABLE` and does not replay the 175 `ALTER` scripts (see 08).
