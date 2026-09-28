"""Phase 2 — discover LedgerSMB's finance and materials model through EKOS, before designing anything.

Every question is asked of EKOS's compiled knowledge (``ekos mcp serve``, read-only, no LLM), and
every question and answer is appended to ``logs/ekos_queries.jsonl`` by ``tools/ekos_log.py``.
The analytical model in ``dbt/`` cites these answers (see ``docs/confluence/02-source-model.md``).

Run:  .venv/bin/python pipelines/discovery/ekos_discovery.py
"""

from __future__ import annotations

import json
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[2] / "tools"))
from ekos_log import EkosMcp  # noqa: E402

STEP = "2-discovery"

#: The tables a finance + materials analytical layer needs, found by the searches below.
CORE_TABLES = [
    "acc_trans", "account", "account_heading", "account_link", "transactions", "gl", "ar", "ap",
    "invoice", "parts", "partsgroup", "entity", "company", "entity_credit_account", "payment",
    "open_item", "oe", "orderitems", "warehouse", "inventory_report", "inventory_report_line",
    "tax", "business_unit", "currency",
]


def first_id(answer: object, name: str) -> str | None:
    """The id of the object literally named ``name`` in an ekos_search / ekos_ekl answer."""
    rows = []
    if isinstance(answer, dict):
        rows = answer.get("matches") or answer.get("rows") or []
    for row in rows:
        if isinstance(row, dict) and str(row.get("name", "")).split(".")[-1] == name:
            return row.get("id")
    return None


def main() -> None:
    mcp = EkosMcp(STEP)
    try:
        mcp.call("ekos_status", {}, "Size and freshness of the compiled LedgerSMB model")
        mcp.call(
            "ekos_ekl",
            {"query": "FIND Object COUNT GROUP BY kind"},
            "Inventory of what EKOS recovered from LedgerSMB, by object kind",
        )
        mcp.call(
            "ekos_ekl",
            {"query": "FIND Object WHERE kind = 'Table' COUNT"},
            "How many database tables were recovered from sql/",
        )

        ids: dict[str, str] = {}
        for table in CORE_TABLES:
            ans = mcp.call(
                "ekos_ekl",
                {"query": f"FIND Object WHERE kind = 'Table' AND name = '{table}'"},
                f"Locate table `{table}` in the compiled model",
            )
            tid = first_id(ans, table)
            if tid:
                ids[table] = tid

        for table in ["acc_trans", "invoice", "parts", "ar", "ap", "transactions", "account"]:
            if table not in ids:
                continue
            mcp.call(
                "ekos_state",
                {"id": ids[table]},
                f"Columns, keys and author comments of `{table}` — the source contract for staging",
            )
            mcp.call(
                "ekos_neighborhood",
                {"id": ids[table], "depth": 1, "max_objects": 200},
                f"Direct relationships of `{table}` (foreign keys, referencing code) — join paths",
            )

        for table in ["acc_trans", "parts", "invoice"]:
            if table in ids:
                mcp.call(
                    "ekos_dependents",
                    {"id": ids[table]},
                    f"What depends on `{table}` — blast radius for the migration unit",
                )
                mcp.call(
                    "ekos_impact",
                    {"id": ids[table], "direction": "dependents", "max_hops": 3},
                    f"Multi-hop impact of changing `{table}`",
                )

        for phrase in [
            "cost of goods sold FIFO",
            "trial balance",
            "balance sheet income statement",
            "inventory adjustment",
            "open item",
            "payment post",
            "aging receivables",
        ]:
            mcp.call(
                "ekos_search",
                {"query": phrase, "limit": 15},
                f"Where LedgerSMB implements '{phrase}' — business logic the marts must reproduce",
            )

        for question in [
            "what depends on the acc_trans table",
            "what depends on the parts table",
            "which tables reference the account table",
        ]:
            mcp.call("ekos_query", {"question": question}, "Compiled structural answer (no LLM)")

        (Path(__file__).resolve().parents[2] / "logs" / "discovery_table_ids.json").write_text(
            json.dumps(ids, indent=2)
        )
    finally:
        mcp.close()


if __name__ == "__main__":
    main()
