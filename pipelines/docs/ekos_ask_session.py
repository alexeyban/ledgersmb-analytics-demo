"""Ask EKOS the business questions a data engineer has before modelling LedgerSMB, on two models.

Each question goes through ``ekos ask`` (EKOS retrieves and cites evidence from the compiled
LedgerSMB sources; an LLM writes the answer) twice:

* **cloud** — the workspace's configured model (OpenCode Zen, deepseek-v4-flash);
* **local** — Ollama llama3:latest on this machine (``ekos/ledgersmb-demo-ollama.toml``).

Both are routed through ``tools/llm_proxy.py``, so ``logs/llm_calls.jsonl`` holds every prompt,
answer and provider-reported token count. The question/answer pairs are in
``logs/ekos_queries.jsonl`` (kind = "ask").

Run:  .venv/bin/python pipelines/docs/ekos_ask_session.py
"""

from __future__ import annotations

import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "tools"))
from ekos_log import ask  # noqa: E402

QUESTIONS = [
    ("How does LedgerSMB compute the cost of goods sold for a sales invoice line?",
     "Needed to trust int_sales_lines: is COGS FIFO, and where is it posted?"),
    ("Which table stores general ledger journal lines, and how are debits and credits represented?",
     "Needed for the sign convention in stg_lsmb__journal_lines"),
    ("What is an open item in LedgerSMB and how are AR invoices settled by payments?",
     "Needed for int_open_item_balances and AR aging"),
    ("What does the inventory_report table record and how is a count variance posted?",
     "Needed for mart_stock_count_variance"),
    ("How does LedgerSMB distinguish customers from vendors in entity_credit_account?",
     "Needed for stg_lsmb__counterparties"),
    ("Which database objects depend on the parts table?",
     "Blast radius of the parts migration unit"),
]

# The step tag. The first session (tag "2b-ask") hit two harness problems — every cloud call was
# rejected 403 by the provider's Cloudflare front (the proxy sent a Python-urllib User-Agent), and
# local answers were mis-parsed — so the final session is tagged separately; both stay in the log.
STEP = sys.argv[1] if len(sys.argv) > 1 else "2b-ask-final"

MODELS = [
    ("cloud", str(ROOT / "ekos" / "ledgersmb-demo.toml"), {}),
    ("local", str(ROOT / "ekos" / "ledgersmb-demo-ollama.toml"),
     {"OLLAMA_BASE_URL": "http://127.0.0.1:8765/ollama"}),
]


def main() -> None:
    for label, config, env in MODELS:
        for question, purpose in QUESTIONS:
            r = ask(question, STEP, purpose, config=config, env=env, label=label)
            ans = r["answer"]
            text = ans.get("answer", "") if isinstance(ans, dict) else str(ans)
            usage = ans.get("token_usage", {}) if isinstance(ans, dict) else {}
            print(f"[{label}] {r['duration_ms'] / 1000:6.1f}s exit={r['exit_code']} "
                  f"tokens={usage.get('input_tokens')}/{usage.get('output_tokens')}  {question[:55]}"
                  f"  -> {len(text)} chars")


if __name__ == "__main__":
    main()
