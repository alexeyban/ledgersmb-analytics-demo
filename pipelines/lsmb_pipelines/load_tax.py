"""Load ``public.tax`` into ``lsmb_raw.tax``, applying the disposition EKOS could not express.

**Why this table is not loaded by EKOS Migrate.** ``ekos migrate assess`` raised
``BLOCK COMPAT.CH.INFINITE_TIMESTAMP — public.tax.validto holds ±infinity, which no target can
represent`` (1 row), and the EKOS load then failed on exactly that row
(``CANNOT_PARSE_DATETIME``). EKOS has no way yet to record a *transform* disposition, because a load
is ``SELECT *`` (tracked in EKOS TODO.md, devlog_226).

**The decision** (finance-controller role, recorded in ``logs/decisions.jsonl``): in LedgerSMB,
``tax.validto = 'infinity'`` means "the rate has no end date". In the target it becomes ``NULL``
with that meaning, documented on the column in ``dbt/models/staging/_sources.yml``. Every other
column is copied as-is.

The load is then **reconciled like an EKOS unit**: row count and a column-wise comparison against
the source, with the transformed column compared under the decision's own rule.
"""

from __future__ import annotations

import json
from datetime import datetime, timezone

import psycopg

from .config import LOGS, clickhouse, settings

DECISION = {
    "unit": "public.tax",
    "finding": "COMPAT.CH.INFINITE_TIMESTAMP on public.tax.validto (1 row)",
    "decision": "map PostgreSQL 'infinity' to NULL, meaning 'no end date'",
    "decided_by": "demo.finance-controller",
    "why": "LedgerSMB uses infinity as an open-ended validity; NULL carries the same meaning and "
    "ClickHouse DateTime64 cannot hold infinity",
}

DDL = """
CREATE TABLE IF NOT EXISTS {db}.tax
(
    chart_id     Int32,
    rate         Nullable(Decimal(18, 6)),
    minvalue     Nullable(Decimal(18, 2)),
    maxvalue     Nullable(Decimal(18, 2)),
    taxnumber    Nullable(String),
    validto      Nullable(DateTime64(6)) COMMENT 'NULL = no end date (source: PostgreSQL infinity)',
    pass         Nullable(Int32),
    taxmodule_id Nullable(Int32)
)
ENGINE = MergeTree
ORDER BY chart_id
"""


def main() -> dict:
    s = settings()
    with psycopg.connect(s.pg_dsn) as pg:
        rows = pg.execute(
            """SELECT chart_id, rate, minvalue, maxvalue, taxnumber,
                      CASE WHEN validto IN ('infinity', '-infinity') THEN NULL ELSE validto END,
                      pass, taxmodule_id,
                      validto = 'infinity' AS was_infinity
               FROM public.tax ORDER BY chart_id"""
        ).fetchall()

    ch = clickhouse()
    ch.command(f"DROP TABLE IF EXISTS {s.raw_db}.tax")
    ch.command(DDL.format(db=s.raw_db))
    ch.insert(
        f"{s.raw_db}.tax",
        [r[:8] for r in rows],
        column_names=["chart_id", "rate", "minvalue", "maxvalue", "taxnumber", "validto", "pass",
                      "taxmodule_id"],
    )

    # Reconcile: count, then every column under the decision's rule.
    target = ch.query(
        f"SELECT chart_id, rate, minvalue, maxvalue, taxnumber, validto, pass, taxmodule_id "
        f"FROM {s.raw_db}.tax ORDER BY chart_id"
    ).result_rows
    mismatches = [
        (src, tgt) for src, tgt in zip(rows, target)
        if (src[0], src[1], src[4], src[6], src[7]) != (tgt[0], tgt[1], tgt[4], tgt[6], tgt[7])
        or (src[8] and tgt[5] is not None)
    ]
    result = {
        "unit": "public.tax",
        "source_rows": len(rows),
        "target_rows": len(target),
        "infinity_rows_mapped_to_null": sum(1 for r in rows if r[8]),
        "column_mismatches": len(mismatches),
        "passed": len(rows) == len(target) and not mismatches,
    }
    stamp = datetime.now(timezone.utc).isoformat()
    with (LOGS / "decisions.jsonl").open("a") as f:
        f.write(json.dumps({"ts": stamp, **DECISION, "applied_by": "pipelines/lsmb_pipelines/load_tax.py",
                            "reconciliation": result}) + "\n")
    return result


if __name__ == "__main__":
    print(json.dumps(main(), indent=2, default=str))
