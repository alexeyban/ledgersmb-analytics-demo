"""The orchestrator: the whole demo, end to end, every step timed and logged.

    .venv/bin/python -m lsmb_pipelines.run            # from pipelines/
    .venv/bin/python -m lsmb_pipelines.run --from dbt_build

Steps, in order (each must succeed before the next runs):

==================  ==========================================================================
schema              LedgerSMB's own sql/ tree into PostgreSQL (sql/load_ledgersmb_schema.sh)
generate            18 months of synthetic, LedgerSMB-posted data (data_generator/generate.py)
migrate             EKOS Migrate: init → discover → profile → assess → map → load (+ approvals)
                    → validate V1-V3 → report (migration/run_all.sh)
load_tax            the one table EKOS cannot load as-is, with the recorded decision
dbt_sources         dbt source docs regenerated from EKOS's compiled knowledge
dbt_build           dbt build: 38 models + all tests (DQ gates — a failing test stops the run)
reconcile           marts vs LedgerSMB's own reports in PostgreSQL (independent oracle)
kpi_report          Confluence KPI page from the marts
dbt_docs            dbt docs generate (static catalog for the documentation site)
==================  ==========================================================================

Each run appends one JSON line per step to ``logs/pipeline_runs.jsonl``: step, start, duration,
exit code, and the tail of its output.
"""

from __future__ import annotations

import argparse
import json
import os
import subprocess
import sys
import time
import uuid
from datetime import datetime, timezone

from .config import LOGS, ROOT

PY = str(ROOT / ".venv" / "bin" / "python")
DBT = str(ROOT / ".venv" / "bin" / "dbt")
ENV = {
    **os.environ,
    "LSMB_PG_PASSWORD": os.environ.get("LSMB_PG_PASSWORD", "ekos-local-only"),
    "LSMB_CH_PASSWORD": os.environ.get("LSMB_CH_PASSWORD", "ekos-local-only"),
    "DBT_PROFILES_DIR": str(ROOT / "dbt"),
    "PYTHONPATH": str(ROOT / "pipelines"),
}

STEPS: list[tuple[str, list[str], str]] = [
    ("schema", [str(ROOT / "sql" / "load_ledgersmb_schema.sh")], str(ROOT)),
    ("generate", [PY, str(ROOT / "data_generator" / "generate.py")], str(ROOT)),
    ("migrate", [str(ROOT / "migration" / "run_all.sh")], str(ROOT)),
    ("load_tax", [PY, "-m", "lsmb_pipelines.load_tax"], str(ROOT / "pipelines")),
    ("dbt_sources", [PY, str(ROOT / "pipelines" / "docs" / "gen_dbt_sources.py")], str(ROOT)),
    ("dbt_build", [DBT, "build"], str(ROOT / "dbt")),
    ("reconcile", [PY, "-m", "lsmb_pipelines.reconcile"], str(ROOT / "pipelines")),
    ("kpi_report", [PY, "-m", "lsmb_pipelines.kpi_report"], str(ROOT / "pipelines")),
    ("dbt_docs", [DBT, "docs", "generate"], str(ROOT / "dbt")),
]


def main() -> int:
    ap = argparse.ArgumentParser(description="Run the LedgerSMB analytics demo end to end.")
    ap.add_argument("--from", dest="start", choices=[s[0] for s in STEPS])
    ap.add_argument("--only", choices=[s[0] for s in STEPS])
    args = ap.parse_args()

    names = [s[0] for s in STEPS]
    first = names.index(args.start) if args.start else 0
    steps = [s for s in STEPS if s[0] == args.only] if args.only else STEPS[first:]
    run_id = uuid.uuid4().hex[:12]
    log = LOGS / "pipeline_runs.jsonl"
    for name, cmd, cwd in steps:
        started = datetime.now(timezone.utc).isoformat()
        t0 = time.monotonic()
        out = subprocess.run(cmd, cwd=cwd, env=ENV, capture_output=True, text=True)
        took = round(time.monotonic() - t0, 2)
        tail = (out.stdout + out.stderr)[-4000:]
        with log.open("a") as f:
            f.write(json.dumps({"run_id": run_id, "step": name, "started": started, "seconds": took,
                                "exit_code": out.returncode, "output_tail": tail}) + "\n")
        mark = "ok  " if out.returncode == 0 else "FAIL"
        print(f"[{mark}] {name:<12} {took:>8.1f}s", flush=True)
        if out.returncode != 0:
            print(tail[-2000:])
            return out.returncode
    return 0


if __name__ == "__main__":
    sys.exit(main())
