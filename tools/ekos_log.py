"""Query EKOS and log every question and answer.

Two entry points, both appending to ``logs/ekos_queries.jsonl``:

* :class:`EkosMcp` — a long-lived ``ekos mcp serve`` session over stdio (the read-only Runtime; no
  LLM). Each ``call`` records the purpose, tool, arguments, the **full** answer and the wall time.
* :func:`ask` — one ``ekos ask --json`` run: EKOS retrieves evidence, and the configured LLM (routed
  through ``tools/llm_proxy.py``) writes a cited answer. Its token usage is in
  ``logs/llm_calls.jsonl``, which this record references by time window.

Every record carries ``step`` (which demo phase asked) and ``purpose`` (why it asked), so the report
can say where EKOS was used, not just that it was.
"""

from __future__ import annotations

import json
import subprocess
import time
from datetime import datetime, timezone
from pathlib import Path
from typing import Any

EKOS = "/home/legion/PycharmProjects/EKOS/ekos/target/release/ekos"
WORKSPACE = "/home/legion/PycharmProjects/LedgerSMB"
ROOT = Path(__file__).resolve().parent.parent
CONFIG = str(ROOT / "ekos" / "ledgersmb-demo.toml")
LOG = ROOT / "logs" / "ekos_queries.jsonl"


def _now() -> str:
    return datetime.now(timezone.utc).isoformat()


def _append(record: dict[str, Any]) -> None:
    LOG.parent.mkdir(parents=True, exist_ok=True)
    with LOG.open("a", encoding="utf-8") as f:
        f.write(json.dumps(record, ensure_ascii=False) + "\n")


class EkosMcp:
    """One ``ekos mcp serve`` process, spoken to over newline-delimited JSON-RPC."""

    def __init__(self, step: str) -> None:
        self.step = step
        self.proc = subprocess.Popen(
            [EKOS, "--config", CONFIG, "mcp", "serve", "--workspace", WORKSPACE],
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            stderr=subprocess.DEVNULL,
            text=True,
            bufsize=1,
        )
        self._id = 0
        self._rpc("initialize", {"protocolVersion": "2025-06-18"})

    def _rpc(self, method: str, params: dict[str, Any]) -> dict[str, Any]:
        self._id += 1
        assert self.proc.stdin and self.proc.stdout
        self.proc.stdin.write(
            json.dumps({"jsonrpc": "2.0", "id": self._id, "method": method, "params": params})
            + "\n"
        )
        self.proc.stdin.flush()
        return json.loads(self.proc.stdout.readline())

    def call(self, tool: str, arguments: dict[str, Any], purpose: str) -> Any:
        """Call ``tool`` and log it. Returns the parsed JSON answer (or the raw text)."""
        started = time.monotonic()
        resp = self._rpc("tools/call", {"name": tool, "arguments": arguments})
        result = resp.get("result") or {}
        text = "".join(b.get("text", "") for b in result.get("content") or [])
        is_error = bool(result.get("isError")) or "error" in resp
        try:
            answer: Any = json.loads(text)
        except json.JSONDecodeError:
            answer = text or resp.get("error")
        _append(
            {
                "ts": _now(),
                "kind": "mcp",
                "step": self.step,
                "purpose": purpose,
                "tool": tool,
                "arguments": arguments,
                "is_error": is_error,
                "duration_ms": round((time.monotonic() - started) * 1000),
                "answer": answer,
            }
        )
        return answer

    def close(self) -> None:
        if self.proc.stdin:
            self.proc.stdin.close()
        self.proc.wait(timeout=30)


def ask(
    question: str,
    step: str,
    purpose: str,
    config: str = CONFIG,
    env: dict[str, str] | None = None,
    label: str = "cloud",
) -> dict[str, Any]:
    """``ekos ask --json`` — an LLM-written answer grounded in EKOS evidence. Logged in full.

    ``config`` / ``env`` select the model (the cloud config, or the Ollama variant with
    ``OLLAMA_BASE_URL`` pointed at the logging proxy); ``label`` names it in the log.
    """
    import os

    started_ts = _now()
    started = time.monotonic()
    out = subprocess.run(
        [EKOS, "--config", config, "ask", "--json", question],
        cwd=WORKSPACE,
        capture_output=True,
        text=True,
        timeout=1800,
        env={**os.environ, **(env or {})},
    )
    # `ekos ask --json` prints its provider-selection INFO line on stdout ahead of the JSON (an EKOS
    # wart: logs belong on stderr in --json mode), so parse from the first line that opens an object.
    body = out.stdout[out.stdout.find("\n{") + 1:] if not out.stdout.lstrip().startswith("{") else out.stdout
    try:
        answer: Any = json.loads(body)
    except json.JSONDecodeError:
        answer = {"raw_stdout": out.stdout[-20000:], "stderr": out.stderr[-4000:]}
    record = {
        "ts": started_ts,
        "ts_end": _now(),
        "kind": "ask",
        "model_label": label,
        "step": step,
        "purpose": purpose,
        "question": question,
        "exit_code": out.returncode,
        "duration_ms": round((time.monotonic() - started) * 1000),
        "answer": answer,
        "llm_calls_window": [started_ts, _now()],
    }
    _append(record)
    return record
