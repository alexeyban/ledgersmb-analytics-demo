# 08 — Decisions and findings

## Decisions

| # | Decision | Why | Owner |
|---|---|---|---|
| D1 | Synthetic data, generated into LedgerSMB's real schema | LedgerSMB ships no ledger data; a schema-only demo can't show reports | maintainer |
| D2 | Post through LedgerSMB's own procedures (`account__save`, `company__save`, `eca__save`, `cogs__add_for_ar_line`, `payment_post`) | So FIFO COGS, open items and payments follow LedgerSMB's logic, not an imitation | demo |
| D3 | Chart of accounts = LedgerSMB's `locale/coa/us/General.xml` | Real chart; every account number is checked against it at startup | demo |
| D4 | `tax.validto = infinity` → NULL ("no end date") | EKOS finding BLOCK `COMPAT.CH.INFINITE_TIMESTAMP`; ClickHouse can't hold infinity | demo.finance-controller (`logs/decisions.jsonl`) |
| D5 | Loads into the **sandbox** environment, R3 units approved by `demo.finance-controller` | Demo environment; the approval workflow is exercised for real | demo |
| D6 | A fresh EKOS Migrate project per official run | A self-approval recorded under a since-fixed EKOS bug stays in the append-only ledger | demo |
| D7 | dbt session `join_use_nulls = 1` | Standard SQL outer joins; a view built under one value can't be read under the other | demo |
| D8 | A revolving loan in the generator (draw below $200k cash, repay above $700k) | The first generated company ended **$1.34M overdrawn**, which is not credible to a finance reader | demo |

## EKOS defects found by this demo — fixed

The demo was the first run of EKOS Migrate against a real ERP schema. Each fix has a regression test
that fails without it (devlog_226, plus the two found afterwards).

| # | Defect | Severity |
|---|---|---|
| 1 | `discover` died on a constraint trigger (`contype "t"`) | blocker |
| 2 | Load chunking assumed integer keys; bounds parsed with a silent `unwrap_or(0)` | blocker |
| 3 | Policy file: kebab-case `[thresholds]` keys rejected | minor |
| 4 | **Self-approval bypass**: `--as cli:<me>` approved the requester's own R3 request | **critical (governance)** |
| 5 | Evidence keys collided (two rules on one column), so raise-then-approve read "evidence changed" | major |
| 6 | Evidence for `public.entity` included `entity_employee`, `entity_note`, … (substring match) | major |
| 7 | DDL emitted `Nullable(LowCardinality(String))`, which ClickHouse rejects | blocker |
| 8 | Unseeded `TABLESAMPLE` gave non-reproducible DDL, so approved loads never matched | major |
| 9 | **Validator hashed unconstrained `numeric` at scale 0**: cents invisible to V1–V3 | **critical (false green)** |
| 10 | NULL booleans hashed as `'f'` on PostgreSQL, `\N` on ClickHouse | major |
| 11 | V2 compared character counts (PG) with byte counts (CH) | major |
| 12 | V2 on empty tables: ClickHouse type defaults vs PostgreSQL NULL | minor |
| 13 | Raw TSV NULL looked the same as the canonical NULL sentinel | minor |
| 14 | `ekos migrate validate` exited 0 on failure | major |
| 15 | **`blast_radius` matched tables by suffix**, so `review` said R1 while `load` said R3 for the same unit | **critical (governance)** |
| 16 | **`load` accepted any approval with matching artifacts**, whatever class it was granted at: an R1, zero-approver approval opened an R3 gate | **critical (governance)** |

## EKOS findings — open

| Finding | Effect |
|---|---|
| `resolve` stops on 15 cross-language homonyms (Table `gl` vs Perl `LedgerSMB::GL`) | needs `--force` (which merges nothing) |
| EKOS compiles only the base DDL, not the 175 `sql/changes` ALTERs | 316 drift findings, part of them artefacts |
| `DQ.UNIQ.001` blocks foreign-key columns | noise among the 276 blocking findings |
| Join harvest mis-attributes aliases (`country.country_id → entity.id`) | wrong FK candidates (never claimed: "not measurable") |
| No transform disposition (e.g. infinity → NULL) | D4 had to live outside EKOS |
| `jsonb` has no canonical rule | those columns are named and skipped in V3 |
| Unit state machine not advanced by `assess`/`map`/`approve`/`load`; `load`/`validate` swallow the illegal-transition error | the report cannot see validated units ("Not signable") |
| `ekos ask --json` prints an INFO log line on stdout before the JSON | breaks naïve JSON consumers |
| A rebuild whose every LLM call fails (403) still exits 0 with warnings | the first rebuild's semantic naming silently did not happen |
| `ekos ask` answer quality on LedgerSMB: cautious but thin; structural MCP tools were more useful | see 02 |

## LedgerSMB (upstream) findings

| Finding | Detail |
|---|---|
| Aging reports broken on 1.14-dev | `report__invoice_aging_summary`: "structure of query does not match function result type"; `_detail`: "column id specified in USING clause does not exist" |
| A change listed twice in `sql/changes/LOADORDER` | `1.6/drop_arap_cols.sql` (once tolerated, once not); LedgerSMB's `db_patches` hash makes it harmless |
| `payment_post` stores unrounded products | amounts like `1.4800000000000000000000` (scale 22): exact, but wide |
| Change scripts rely on per-change transactions | `CREATE TEMPORARY TABLE … ON COMMIT DROP` read in a later statement |

## Demo-harness problems (ours, fixed)

| Problem | Effect |
|---|---|
| The LLM proxy forwarded without a User-Agent, so urllib sent `Python-urllib`, which Cloudflare rejects | **the first 32 cloud calls failed with 403**, including all 26 in the first EKOS rebuild |
| Generator: 8 of 16 guessed account numbers were wrong or meant something else (e.g. 2310 = 401K, not sales tax) | caught by checking against the loaded chart before any data was posted |
| Schema loader initially ran changes without per-change transactions, from the wrong directory, without `lsmb_schema`, and re-ran duplicates | fixed to mirror LedgerSMB's installer: 0 failures |
