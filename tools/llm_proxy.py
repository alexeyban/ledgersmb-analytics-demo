"""Logging reverse proxy for every LLM call the demo makes.

EKOS's LLM providers receive token usage from the API but do not print it. Instead of modifying
EKOS for a demo, its endpoints are pointed through this proxy:

    [llm] base-url = "http://127.0.0.1:8765/openai"     # cloud, OpenAI-compatible
    OLLAMA_BASE_URL=http://127.0.0.1:8765/ollama          # local Ollama

Each call is appended to ``logs/llm_calls.jsonl`` with its route, model, request messages,
response text and the **provider-reported** token counts (OpenAI: ``usage.prompt_tokens`` and
``usage.completion_tokens``; Ollama: ``prompt_eval_count`` and ``eval_count``).

Streaming responses (OpenAI SSE, Ollama NDJSON) are buffered whole before being returned, so the
final usage record can be read. The client still receives the identical bytes.

The ``Authorization`` header is forwarded upstream and never written to the log.
"""

from __future__ import annotations

import json
import sys
import threading
import time
import urllib.error
import urllib.request
from datetime import datetime, timezone
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path

UPSTREAMS = {
    "openai": "https://opencode.ai/zen/v1",
    "ollama": "http://127.0.0.1:11434",
}
LOG = Path(__file__).resolve().parent.parent / "logs" / "llm_calls.jsonl"
_lock = threading.Lock()


def _usage_from(route: str, body: bytes) -> tuple[str | None, int, int, str]:
    """(model, input_tokens, output_tokens, text) from a buffered response body."""
    model, tin, tout, text = None, 0, 0, []
    raw = body.decode("utf-8", "replace")
    if route == "openai":
        if raw.lstrip().startswith("data:"):  # SSE stream
            for line in raw.splitlines():
                if not line.startswith("data:") or line.strip() == "data: [DONE]":
                    continue
                try:
                    ev = json.loads(line[5:])
                except json.JSONDecodeError:
                    continue
                model = ev.get("model", model)
                for ch in ev.get("choices") or []:
                    text.append((ch.get("delta") or {}).get("content") or "")
                if ev.get("usage"):
                    tin = ev["usage"].get("prompt_tokens", tin)
                    tout = ev["usage"].get("completion_tokens", tout)
        else:
            ev = json.loads(raw)
            model = ev.get("model")
            text = [(c.get("message") or {}).get("content") or "" for c in ev.get("choices") or []]
            usage = ev.get("usage") or {}
            tin, tout = usage.get("prompt_tokens", 0), usage.get("completion_tokens", 0)
    else:  # ollama: one JSON object, or NDJSON when streaming
        for line in raw.splitlines() or [raw]:
            try:
                ev = json.loads(line)
            except json.JSONDecodeError:
                continue
            model = ev.get("model", model)
            text.append((ev.get("message") or {}).get("content") or ev.get("response") or "")
            if ev.get("done"):
                tin = ev.get("prompt_eval_count", tin)
                tout = ev.get("eval_count", tout)
    return model, tin, tout, "".join(text)


class Proxy(BaseHTTPRequestHandler):
    def _forward(self) -> None:
        route, _, rest = self.path.lstrip("/").partition("/")
        if route not in UPSTREAMS:
            self.send_error(404, f"unknown route {route!r}")
            return
        length = int(self.headers.get("Content-Length") or 0)
        req_body = self.rfile.read(length) if length else None
        url = f"{UPSTREAMS[route]}/{rest}"
        headers = {k: v for k, v in self.headers.items() if k.lower() not in {"host", "content-length"}}
        started = time.monotonic()
        try:
            with urllib.request.urlopen(
                urllib.request.Request(url, data=req_body, headers=headers, method=self.command),
                timeout=900,
            ) as up:
                status, resp_headers, resp_body = up.status, dict(up.headers), up.read()
        except urllib.error.HTTPError as e:
            status, resp_headers, resp_body = e.code, dict(e.headers), e.read()

        self.send_response(status)
        for k, v in resp_headers.items():
            if k.lower() not in {"transfer-encoding", "content-length", "connection"}:
                self.send_header(k, v)
        self.send_header("Content-Length", str(len(resp_body)))
        self.end_headers()
        self.wfile.write(resp_body)

        if self.command == "POST" and req_body:
            try:
                req = json.loads(req_body)
            except json.JSONDecodeError:
                req = {}
            try:
                model, tin, tout, text = _usage_from(route, resp_body)
            except Exception as e:  # never let logging break the call
                model, tin, tout, text = None, 0, 0, f"<unparsed: {e}>"
            record = {
                "ts": datetime.now(timezone.utc).isoformat(),
                "route": route,
                "endpoint": rest,
                "status": status,
                "model": model or req.get("model"),
                "input_tokens": tin,
                "output_tokens": tout,
                "duration_ms": round((time.monotonic() - started) * 1000),
                "messages": req.get("messages") or req.get("prompt"),
                "response": text,
            }
            with _lock, LOG.open("a", encoding="utf-8") as f:
                f.write(json.dumps(record, ensure_ascii=False) + "\n")

    do_POST = _forward
    do_GET = _forward

    def log_message(self, fmt: str, *args: object) -> None:  # quiet
        pass


if __name__ == "__main__":
    port = int(sys.argv[1]) if len(sys.argv) > 1 else 8765
    LOG.parent.mkdir(parents=True, exist_ok=True)
    print(f"llm proxy on 127.0.0.1:{port} -> {UPSTREAMS}, logging to {LOG}", flush=True)
    ThreadingHTTPServer(("127.0.0.1", port), Proxy).serve_forever()
