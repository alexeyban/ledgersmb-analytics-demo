# 03 — The migration: EKOS Migrate, PostgreSQL → ClickHouse

Project `ledgersmb-analytics-official`. Every command and its full output is in `logs/migration.log`;
the per-unit summary is `logs/migration_units.tsv`. Credentials never appear in a statement or in the
ledger. The source is read through a ClickHouse **named collection** (`lsmb_source`), and passwords
come from environment variables that the config only *names* (`LSMB_PG_PASSWORD`,
`LSMB_CH_PASSWORD`).

## Stages and what each produced

| Stage | Command | Result on LedgerSMB |
|---|---|---|
| init | `ekos migrate init --source postgres://lsmb-pg/ledgersmb --target clickhouse://lsmb-ch/lsmb_raw` | Project + connection references (names of secrets only) |
| discover | `ekos migrate discover` | **168** migration units. Catalog: 1,205 columns, 158 PKs, 298 FKs, 66 unique, 72 check, 62 indexes, 86 sequences, **503 functions**, 29 triggers, 16 views |
| drift | (part of discover) | **316** findings: repository DDL vs deployed schema (see 02) |
| profile | `ekos migrate profile --tier p1` | 168 units profiled; **28 columns classified as personal data**, whose bounds and top-k are never recorded |
| assess | `ekos migrate assess` | **674 findings, 276 blocking**; 28 inferred-FK candidates from real code joins and `pg_stat_statements` |
| map | `ekos migrate map --emit` | ClickHouse DDL for 158 tables with the reasoning as comments (`clickhouse/ddl/ekos_generated_raw.sql`) |
| review / approve | `ekos migrate review …` / `approve …` | Risk computed per unit; 6 units **R3** needed a human approval |
| load | `ekos migrate load --unit … --env sandbox` | 30 tables, each statement parsed, classified and gated |
| validate | `ekos migrate validate --unit … --tier v3` | **30/30 pass V1, V2 and V3** |
| report | `ekos migrate report` | Compiled from ledger facts; **"Not signable"**, with its reasons (below) |

## Risk and approvals (RFC 0161)

EKOS computes each load's risk from statement class × environment × lossiness × **blast radius**
(how many compiled objects depend on the table) × affected rows. With the demo policy
(`migration/migrate.policy.toml`: blast radius > 10 or > 1000 rows escalates), six units needed an
approval even in the sandbox:

| Unit | Why R3 (EKOS's own words) |
|---|---|
| `acc_trans` | 11 downstream consumers depend on this (threshold 10) |
| `transactions` | 26 downstream consumers |
| `parts` | 27 downstream consumers |
| `entity_credit_account` | 26 downstream consumers |
| `country` | 16 downstream consumers |
| `entity` | computed at run time (varies with the compiled graph) |

For each one the demo raised the request, **tried to approve it as the requester (refused all six
times: "an approver may not be the requester")**, then approved it as `demo.finance-controller` with
the evidence rendered. Each approval is pinned to the artifacts' content hashes and to an evidence
snapshot; if either changes, the approval dies.

## Validation (RFC 0155 / 0156)

| Tier | Checks | Result |
|---|---|---|
| V1 | row counts, source vs target | 30/30 |
| V2 | per column: nulls, min, max, total byte length of the canonical form | 30/30 |
| V3 | row hashes over a canonical, engine-independent rendering, summed per bucket | 30/30 |

**Planted-control check.** One journal line was changed by one cent in ClickHouse only. V1 and V2
stayed green (as RFC 0156 says they must: neither can see a single-cent change inside a large
column), and **V3 failed on exactly one bucket, with exit code 1.** After reverting, all tiers passed
again. Logged in `logs/migration_attempt2.log`.

Columns V3 cannot hash are named, never silently dropped: `jsonb` columns (`acc_trans.additional_data`,
`custom_attributes`) have no canonical rule yet.

## The one table EKOS did not load

`tax.validto` holds PostgreSQL `infinity`. EKOS predicted the problem at assess time (`BLOCK
COMPAT.CH.INFINITE_TIMESTAMP`, 1 row), and the load then failed on exactly that row. EKOS cannot yet
record a transform decision, since a load is `SELECT *`. So `pipelines/lsmb_pipelines/load_tax.py`
applies the decision "infinity → NULL = no end date", records it in `logs/decisions.jsonl`, and
reconciles the table (1/1 rows, 0 mismatches).

## Why the report says "Not signable"

`docs/migration_report.md` is compiled from 2,214 ledger facts, with groundedness 1.000. It refuses
sign-off, correctly:

1. **Units not validated in the state machine.** RFC 0154's lifecycle needs *assessed → planned →
   mapped → approved → … → validated*. `assess` only advances units with no blocking findings, and
   dispositions for blocking findings are not built yet, so no unit can reach "validated" even though
   V1–V3 passed. The CLI also *swallows* the illegal-transition error on load/validate (an EKOS
   finding, see 08).
2. **Unexplained divergences** without an approved disposition (the disposition workflow again).
3. **Planted control missed.** The one-cent control was run by hand, not through
   `ekos migrate validate`, so EKOS rightly does not count it.

These are real gaps in EKOS Migrate's workflow, not in the data. The data is proven by V1–V3, by
the planted control, and by the independent reconciliation in 06.
