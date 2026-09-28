# 07 — Runbook

## Prerequisites

| Need | Version used | Notes |
|---|---|---|
| Docker | — | runs the PostgreSQL 16 and ClickHouse 24.8 sandboxes |
| EKOS | local build, `ekos/target/release/ekos` | includes the devlog_226 fixes |
| LedgerSMB checkout | master @ 544bcd947 | `sql/`, `locale/` are read; its `.ekos/` holds the compiled knowledge |
| Python | 3.10 + uv | `uv sync` in the repo installs psycopg, clickhouse-connect, dbt-core 1.10, dbt-clickhouse 1.10 |

## Start the sandboxes

```bash
cd ../EKOS && docker compose -f docker-compose.migrate.yml up -d     # ports bound to 127.0.0.1
# one-time ClickHouse admin step (named collection + databases):
#   see migration/clickhouse_setup.sql — run each statement separately (HTTP rejects multi-statement)
```

## Run everything

```bash
python3 tools/llm_proxy.py 8765 &          # logs every LLM call + tokens to logs/llm_calls.jsonl
cd pipelines && PROJECT=my-run ../.venv/bin/python -m lsmb_pipelines.run
```

| Step | Typical time | Fails when |
|---|---|---|
| schema | 13 s | a LedgerSMB SQL file fails (see `logs/schema_load.tsv`) |
| generate | 37 s | a LedgerSMB procedure rejects a posting |
| migrate | 3–4 min | a load is refused or a tier fails (exit ≠ 0 since devlog_226) |
| load_tax | < 1 s | tax reconciliation mismatches |
| dbt_sources | 20 s | EKOS MCP unavailable |
| dbt_build | 7 s | **any DQ test fails** — the run stops here |
| reconcile | < 1 s | any mart ≠ LedgerSMB's own report |
| kpi_report, dbt_docs | 4 s | — |

Resume from a step: `python -m lsmb_pipelines.run --from dbt_build`. Run one: `--only reconcile`.

## Operating notes

* **Use a fresh `PROJECT` per full run.** Approvals are pinned to artifact hashes and evidence. The
  generator is deterministic, so re-running under the same project finds the previous approvals
  still valid and skips the approval workflow. That is correct behaviour, but it hides the workflow
  in a demo.
* **ANALYZE after a bulk load.** P1 profile estimates come from planner statistics. `run_all.sh`
  runs `ANALYZE` before profiling; without it, small tables report 0 rows.
* **Cloud LLM through the proxy needs a User-Agent.** The provider's Cloudflare front rejects
  `Python-urllib`. The proxy sets its own; see 08.
* **Credentials.** Sandbox passwords are local-only defaults. In a real deployment, set
  `LSMB_PG_PASSWORD` / `LSMB_CH_PASSWORD`, configure the ClickHouse named collection server-side,
  and never put a password in `ekos.toml` or a DSN (EKOS refuses a DSN with a password).

## Where things are

| Artifact | Path |
|---|---|
| ClickHouse raw DDL (EKOS-generated, with reasoning) | `clickhouse/ddl/ekos_generated_raw.sql` |
| dbt project | `dbt/` |
| Python pipelines | `pipelines/lsmb_pipelines/` |
| Migration report (EKOS-compiled) | `docs/migration_report.md` |
| All EKOS queries and answers | `logs/ekos_queries.jsonl` → rendered in `docs/QUERY_LOG.md` |
| All LLM calls with tokens | `logs/llm_calls.jsonl` → summarised in `docs/REPORT.md` |
