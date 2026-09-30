# LedgerSMB → ClickHouse analytics, with EKOS

An end-to-end, evidence-backed demo. The **LedgerSMB** (https://github.com/ledgersmb/LedgerSMB) ERP (Perl + PostgreSQL) is migrated to
**ClickHouse** by **EKOS Migrate** (RFC 0154–0168)(https://github.com/alexeyban/EKOS) , modelled in **dbt**, orchestrated in **Python**,
and reconciled to the cent against LedgerSMB's own reports. Every AI interaction is logged, with
tokens per model.

> **Synthetic data.** *Harbor Mill Supply Co.* is a simulated distributor: 18 months generated into
> LedgerSMB's real schema and posted through LedgerSMB's own stored procedures.

## Start here

| Read | For |
|---|---|
| [`presentation/index.html`]([https://alexeyban.github.io/EKOS/presentations/ledgersmb-analytics-migration.html]) | the detailed deck (50 slides; ← → to navigate, O overview, T theme) |
| [`docs/REPORT.md`](docs/REPORT.md) | where EKOS, Claude Code and other LLMs were used; tokens per model |
| [`docs/QUERY_LOG.md`](docs/QUERY_LOG.md) | every EKOS query and answer |
| [`docs/confluence/`](docs/confluence/) | the Confluence pages, 01 → 08 |
| [`docs/migration_report.md`](docs/migration_report.md) | EKOS Migrate's own compiled, cited report |

## Results of the official run

| | |
|---|---|
| Tables migrated and validated V1 + V2 + V3 | 30 / 30 (plus `tax` via Python, with a recorded decision) |
| Human approvals required by computed risk | 8 units; self-approval refused 8 / 8 |
| dbt | 162 / 162 (38 models, 124 tests) |
| Reconciliation against LedgerSMB's own reports | 6 / 6, to the cent |
| EKOS defects found by the demo and fixed | 16 (EKOS devlog_226) |

## Run it

```bash
# 1. sandboxes (from the EKOS repo) — PostgreSQL 16 + ClickHouse 24.8, bound to 127.0.0.1
cd ../EKOS && docker compose -f docker-compose.migrate.yml up -d && cd -
#    one-time ClickHouse admin step: the statements in migration/clickhouse_setup.sql

# 2. environment
uv sync                                   # psycopg, clickhouse-connect, dbt-core 1.10, dbt-clickhouse
python3 tools/llm_proxy.py 8765 &         # logs every LLM call and its tokens

# 3. everything, from an empty database (≈ 5 minutes)
cd pipelines && PROJECT=my-run ../.venv/bin/python -m lsmb_pipelines.run

# 4. regenerate the reports and the deck from the logs
cd .. && .venv/bin/python pipelines/docs/usage_report.py && .venv/bin/python presentation/build_presentation.py
```

## Repository

| Path | Contents |
|---|---|
| `sql/` | LedgerSMB schema loader (mirrors LedgerSMB's installer), seed loader, analyst queries |
| `data_generator/` | the synthetic company, posted through LedgerSMB's procedures |
| `ekos/` | the demo's EKOS configs (cloud, and a local Ollama variant) |
| `migration/` | EKOS Migrate orchestration, approval policy, ClickHouse admin setup |
| `clickhouse/ddl/` | EKOS-generated raw DDL (with reasoning) and the deployed DDL of every table |
| `dbt/` | the analytical project: models, tests, macros, analyses, docs |
| `pipelines/` | orchestrator, `tax` loader, reconciliation, KPI report, doc generators |
| `tools/` | the LLM logging proxy and the EKOS query logger |
| `logs/` | every query, answer, LLM call, migrate command and pipeline run |
| `docs/`, `presentation/` | documentation and the deck (generated from `logs/`) |
