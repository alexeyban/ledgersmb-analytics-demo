# LedgerSMB → ClickHouse analytics demo: plan

**Goal:** an end-to-end, reproducible demo of EKOS Migrate (RFC 0154–0168) on the real LedgerSMB ERP
sources. It builds an analytical layer in ClickHouse (financial reporting, product and materials
reporting) with dbt and Python pipelines, and every AI interaction is logged.

**Decisions (maintainer, 2026-09-28)**
- Source data is **synthetic**, deterministic and generated into LedgerSMB's **real** schema.
  LedgerSMB ships no ledger data. Everything is labelled synthetic.
- LLMs used: **local Ollama** plus the workspace's **configured cloud model** (opencode zen), both
  logged through a local proxy with provider-reported token counts.
- This repo sits next to EKOS; the EKOS repo stays clean.
- RFCs 0164–0167 are designed but **not implemented**, and are shown as such. No output is faked.

## Phases

| # | Phase | Output |
|---|---|---|
| 0 | Scaffold, logging proxy, token ledger | `logs/`, `tools/llm_proxy.py` |
| 1 | Environment: PG + ClickHouse sandboxes, LedgerSMB schema loaded from its own `sql/` | `sql/load_schema.sh` |
| 2 | EKOS discovery over the LedgerSMB sources: which tables, keys and procedures matter for finance and materials | `logs/ekos_queries.jsonl` |
| 3 | Synthetic data generator into the real schema | `data_generator/` |
| 4 | EKOS Migrate: init → discover → profile → assess → map → review/approve → load → validate → report | `migration/` |
| 5 | ClickHouse analytical layer via dbt: staging → intermediate → marts | `dbt/` |
| 6 | Python pipelines: orchestration, extract/load, reconciliation, run log | `pipelines/` |
| 7 | DQ: dbt tests, generic and singular, plus source freshness | `dbt/tests/` |
| 8 | Documentation: dbt docs and descriptions, Python docstrings, Confluence Markdown | `docs/confluence/` |
| 9 | Report: where EKOS, Claude Code and other LLMs were used, tokens per model, every query and answer | `docs/REPORT.md` |
| 10 | Detailed HTML presentation | `presentation/index.html` |

## Honesty rules for this demo
- Every number in the report comes from a log file in `logs/`.
- A step that did not run, or ran partially, says so.
- Claude Code token figures are **estimates** from the session's context counter, and are labelled
  that way. EKOS/Ollama/cloud figures are **provider-reported**.
