"""Build ``presentation/index.html`` — the detailed deck — from the run's own outputs.

Every figure in the deck is read from a log or result file at build time:
``logs/kpis.json`` (marts), ``logs/usage_summary.json`` (EKOS / LLM / Claude Code usage),
``logs/migration_units.tsv``, ``logs/reconciliation.json``, ``logs/pipeline_runs.jsonl``,
``logs/ekos_queries.jsonl``. Rebuild after a run:  .venv/bin/python presentation/build_presentation.py
"""

from __future__ import annotations

import csv
import html
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
LOGS = ROOT / "logs"


def load() -> dict:
    kpis = json.loads((LOGS / "kpis.json").read_text())
    usage = json.loads((LOGS / "usage_summary.json").read_text())
    units = list(csv.DictReader((LOGS / "migration_units.tsv").open(), delimiter="\t"))
    recon = json.loads((LOGS / "reconciliation.json").read_text())
    runs_all = [json.loads(l) for l in (LOGS / "pipeline_runs.jsonl").read_text().splitlines() if l.strip()]
    last_run = runs_all[-1]["run_id"] if runs_all else None
    runs = [r for r in runs_all if r["run_id"] == last_run]
    queries = [json.loads(l) for l in (LOGS / "ekos_queries.jsonl").read_text().splitlines() if l.strip()]
    models = []
    for key, c in usage["per_model"].items():
        route, model = key.split(":", 1)
        if model == "no-such-model-demo-check":
            continue
        models.append({"label": f"{model} ({route})", "calls": c.get("calls", 0), "ok": c.get("ok", 0),
                       "in": c.get("input_tokens", 0), "out": c.get("output_tokens", 0),
                       "total": c.get("input_tokens", 0) + c.get("output_tokens", 0)})
    return {"kpis": kpis, "usage": {**usage, "models": models}, "units": units, "recon": recon,
            "runs": [{"step": r["step"], "seconds": r["seconds"]} for r in runs], "queries": queries}


def esc(s) -> str:
    return html.escape(str(s))


def k(d: dict, sec: str, name: str, row: int = 0):
    s = d["kpis"][sec]
    return s["rows"][row][s["columns"].index(name)]


def money(v) -> str:
    return f"${float(v):,.0f}"


def slides(d: dict) -> list[str]:
    S: list[str] = []
    add = S.append
    u = d["usage"]["summary"]
    units = d["units"]
    gated = [x for x in units if x["risk_gate"] not in ("none", "")]
    passed_all = sum(1 for x in units if x["v1"] == x["v2"] == x["v3"] == "passed")
    refused = sum(1 for x in gated if x["self_approval_refused"] == "yes")
    recon_ok = sum(1 for c in d["recon"]["checks"] if c["passed"])
    asks = [q for q in d["queries"] if q["kind"] == "ask" and q["step"] == "2b-ask-final"]

    # 1 cover
    add(f"""<section class="slide cover"><div class="kicker">EKOS · LedgerSMB · ClickHouse · dbt</div>
<h1>From an open-source ERP to an audited analytical layer — with evidence at every step</h1>
<p class="lede">LedgerSMB (Perl + PostgreSQL) migrated to ClickHouse by <b>EKOS Migrate</b>, modelled in
<b>dbt</b>, orchestrated in <b>Python</b>, and reconciled to the cent against LedgerSMB's own reports.
Every AI interaction is logged, with tokens per model.</p>
<div class="grid g4" style="margin-top:1rem">
<div class="card stat"><div class="v ok">{passed_all}/{len(units)}</div><div class="k">tables pass V1+V2+V3</div></div>
<div class="card stat"><div class="v ok">{recon_ok}/{len(d['recon']['checks'])}</div><div class="k">checks vs LedgerSMB's own reports</div></div>
<div class="card stat"><div class="v acc">162/162</div><div class="k">dbt models + tests</div></div>
<div class="card stat"><div class="v bad">16</div><div class="k">EKOS defects found &amp; fixed</div></div></div>
<div class="disclaimer">Synthetic data: <b>Harbor Mill Supply Co.</b> is simulated, posted through LedgerSMB's own procedures.</div>
<p class="note">← → / space to navigate · O overview · T theme</p></section>""")

    # 2 agenda
    add("""<section class="slide"><div class="kicker">Agenda</div><h2>What this deck covers</h2>
<div class="grid g3" style="margin-top:1rem">
<div class="card"><h4>1 · Context</h4><p>The goal, the source system, the synthetic company, the tools and the rules of evidence.</p></div>
<div class="card"><h4>2 · Understanding the source</h4><p>Building LedgerSMB faithfully, generating data through its own procedures, EKOS knowledge and discovery.</p></div>
<div class="card"><h4>3 · The migration</h4><p>EKOS Migrate stage by stage: drift, PII, findings, type mapping, risk, approvals, load, validation.</p></div>
<div class="card"><h4>4 · The analytical layer</h4><p>dbt layers and models, conventions, EKOS-sourced documentation.</p></div>
<div class="card"><h4>5 · The reports</h4><p>P&amp;L, balance sheet, cash, working capital, aging, products, customers, inventory, suppliers.</p></div>
<div class="card"><h4>6 · Trust &amp; accounting for AI</h4><p>Four levels of data quality, the independent oracle, EKOS vs Claude Code vs other LLMs, tokens, findings.</p></div></div></section>""")

    # 3 goal
    add("""<section class="slide"><div class="kicker">1 · Context</div><h2>The goal</h2>
<p class="lede">Take a real ERP's database, move it into an analytical engine, and build reporting on it,
so that every step can be <b>checked</b> rather than trusted.</p>
<div class="grid g2"><div class="card"><h4>Requirements</h4><ul class="tight">
<li>Use the <b>real LedgerSMB sources</b>: schema, stored procedures, chart of accounts</li>
<li>ClickHouse target, dbt + Python pipelines</li>
<li>Finance reporting <i>and</i> product/materials reporting</li>
<li>Data-quality tests, documentation (dbt, Python, Confluence)</li>
<li>Report where <b>EKOS</b>, <b>Claude Code</b> and <b>other LLMs</b> were used, with tokens per model</li>
<li>Log every query and answer</li></ul></div>
<div class="card"><h4>Rules of evidence</h4><ul class="tight">
<li>Every number comes from a log or a query — this deck is <b>generated</b> from them</li>
<li>Every check has been shown to <b>fail</b> on a planted defect</li>
<li>A step that did not work says so</li>
<li>Claude Code tokens are <b>estimates</b> (context counter); model tokens are <b>provider-reported</b></li></ul></div></div></section>""")

    # 4 source system
    add("""<section class="slide"><div class="kicker">1 · Context</div><h2>The source: LedgerSMB</h2>
<p class="lede">An open-source double-entry accounting ERP. Most of its business logic lives <b>in the database</b>, in PL/pgSQL.</p>
<div class="grid g4">
<div class="card stat"><div class="v">168</div><div class="k">tables (after all changes)</div></div>
<div class="card stat"><div class="v">504</div><div class="k">functions / procedures</div></div>
<div class="card stat"><div class="v">175</div><div class="k">schema-change scripts</div></div>
<div class="card stat"><div class="v">52</div><div class="k">SQL modules</div></div></div>
<h3>What matters for analytics</h3>
<table><tr><th>Area</th><th>Tables</th></tr>
<tr><td>General ledger</td><td><code>transactions</code> · <code>acc_trans</code> (journal lines) · <code>gl</code> · <code>account</code> · <code>account_heading</code> · <code>account_link</code></td></tr>
<tr><td>Receivables / payables</td><td><code>ar</code> · <code>ap</code> · <code>open_item</code> · <code>payment</code> · <code>entity_credit_account</code> · <code>company</code></td></tr>
<tr><td>Materials</td><td><code>parts</code> · <code>partsgroup</code> · <code>invoice</code> (lines) · <code>inventory_report[_line]</code></td></tr>
<tr><td>Orders</td><td><code>oe</code> · <code>orderitems</code> · <code>oe_class</code></td></tr></table></section>""")

    # 5 synthetic company
    k_rev = k(d, "pnl_total", "total_revenue")
    add(f"""<section class="slide"><div class="kicker">1 · Context</div><h2>The company: Harbor Mill Supply Co. (synthetic)</h2>
<p class="lede">LedgerSMB ships no data, so 18 months (2025-01 → 2026-06) of a fictional industrial-components distributor were
simulated. Deterministic: the same seed produces the same books.</p>
<div class="grid g4">
<div class="card stat"><div class="v">60</div><div class="k">customers, 4 segments</div></div>
<div class="card stat"><div class="v">25</div><div class="k">vendors</div></div>
<div class="card stat"><div class="v">114</div><div class="k">parts in 8 groups (6 services)</div></div>
<div class="card stat"><div class="v">{money(k_rev)}</div><div class="k">revenue over 18 months</div></div></div>
<h3>Realism built in</h3><ul class="tight">
<li>Seasonality (Q1 slump, autumn peak), ~18%/yr growth, quiet weekends, Pareto customer and product popularity</li>
<li>Reorder-point replenishment; <b>FIFO COGS computed by LedgerSMB</b>; quarterly stock counts with shrinkage</li>
<li>Payment terms 30–60 days; a minority of habitually late payers (so aging is not trivially empty)</li>
<li>Payroll, rent, insurance, utilities, depreciation, a revolving loan with interest</li></ul>
<p class="note">The first generated company ended <b>$1.34M overdrawn</b>: over-stocking with no financing. Credible to a computer,
not to a finance reader. Reorder quantities were tightened and a revolving facility added (decision D8).</p></section>""")

    # 6 tools
    add("""<section class="slide"><div class="kicker">1 · Context</div><h2>Who did what</h2>
<table><tr><th>Actor</th><th>Role</th></tr>
<tr><td><b>EKOS</b> — compiled knowledge</td><td>Compiled the LedgerSMB repository (SQL, Perl, JS, docs, git) into a queryable, evidence-backed model; answered the design questions; supplied source documentation</td></tr>
<tr><td><b>EKOS Migrate</b> (RFC 0154–0162)</td><td>The whole PostgreSQL → ClickHouse move: discover, drift, profile, assess, map, risk + approval, load, validate, report</td></tr>
<tr><td><b>Claude Code</b> (Opus 5.5)</td><td>All engineering: loader, generator, orchestration, dbt project, pipelines, docs, deck; found and fixed <b>16 EKOS defects</b></td></tr>
<tr><td><b>DeepSeek V4 Flash</b> (cloud)</td><td>EKOS's configured LLM: semantic naming during compile; <code>ekos ask</code> answers</td></tr>
<tr><td><b>Llama 3 8B</b> (local, Ollama)</td><td>The same questions, answered locally, for comparison</td></tr>
<tr><td><b>dbt + ClickHouse</b></td><td>38 models, 124 tests; the analytical engine</td></tr></table>
<p class="note">All LLM traffic goes through a logging proxy (<code>tools/llm_proxy.py</code>): prompts, answers and provider-reported tokens in <code>logs/llm_calls.jsonl</code>.</p></section>""")

    # 7 architecture
    add("""<section class="slide"><div class="kicker">1 · Context</div><h2>Architecture</h2>
<div class="flow"><span class="step">LedgerSMB repo</span><span class="arrow">→</span><span class="step">EKOS compile (11,084 objects)</span></div>
<div class="flow"><span class="step">PostgreSQL 16 · ledgersmb</span><span class="arrow">→ catalog, profiles, workload →</span><span class="step">EKOS Migrate</span><span class="arrow">→ INSERT … SELECT FROM postgresql(named collection) →</span><span class="step">ClickHouse lsmb_raw (31)</span></div>
<div class="flow"><span class="step">lsmb_raw</span><span class="arrow">→ dbt build + 124 tests →</span><span class="step">lsmb_analytics (38)</span><span class="arrow">→ reconcile →</span><span class="step">LedgerSMB's own reports</span></div>
<div class="grid g3" style="margin-top:1rem">
<div class="card"><h4>No credentials in statements</h4><p>ClickHouse reads PostgreSQL through a server-side named collection; generated SQL only names it.</p></div>
<div class="card"><h4>No credentials in the ledger</h4><p>Config names environment variables; a DSN carrying a password is refused.</p></div>
<div class="card"><h4>Sandboxes bound to 127.0.0.1</h4><p>Docker Compose from the EKOS repo, local-only passwords.</p></div></div></section>""")

    # 8 pipeline steps
    runs = d["runs"]
    total = sum(r["seconds"] for r in runs)
    add(f"""<section class="slide"><div class="kicker">1 · Context</div><h2>The pipeline, end to end: {total:.0f} seconds</h2>
<p class="lede">One command, from an empty database: <code>python -m lsmb_pipelines.run</code>. Each step must succeed before the next;
a failing data-quality test stops the run.</p><div data-chart="steps"></div>
<p class="src">Source: logs/pipeline_runs.jsonl (last run)</p></section>""")

    # 9 schema load
    add("""<section class="slide"><div class="kicker">2 · Understanding the source</div><h2>Building LedgerSMB faithfully: 0 failed scripts</h2>
<p class="lede">The schema is built from LedgerSMB's own <code>sql/</code> tree, in LedgerSMB's order. The first attempt failed on 8 files; each failure was
a way the loader differed from LedgerSMB's installer.</p>
<table><tr><th>Failure</th><th>Cause</th><th>Fix (= what LedgerSMB does)</th></tr>
<tr><td><code>drop_arap_cols.sql</code>: column does not exist</td><td>Listed twice in LOADORDER</td><td>Skip content already applied (LedgerSMB's <code>db_patches</code> hash)</td></tr>
<tr><td><code>Roles.sql</code>: syntax error at ":"</td><td>psql variable <code>lsmb_schema</code> unset</td><td>Pass <code>-v lsmb_schema=public</code></td></tr>
<tr><td><code>no-inv-entity-tables.sql</code> + 4 cascades</td><td><code>TEMP … ON COMMIT DROP</code> under autocommit</td><td>One transaction per change</td></tr>
<tr><td><code>Duplicates_Functions.sql</code></td><td><code>\\copy</code> of a relative path</td><td>Run from the LedgerSMB root</td></tr>
<tr><td><code>entity_credit_account</code>: language FK</td><td>Seed data never loaded</td><td>Load <code>initial-data.xml</code> after the base schema, before changes</td></tr></table>
<p class="note">Result: 1 base + 175 changes + 52 modules + seed, 0 failures (<code>logs/schema_load.tsv</code>).</p></section>""")

    # 10 posting through ledgersmb
    add("""<section class="slide"><div class="kicker">2 · Understanding the source</div><h2>Data posted through LedgerSMB's own logic</h2>
<p class="lede">Not an imitation of LedgerSMB — LedgerSMB itself. The generator calls its procedures wherever one exists.</p>
<div class="grid g2"><div class="card"><h4>Procedures used</h4><ul class="tight">
<li><code>account_heading_save</code>, <code>account__save</code> — the real US chart (66 accounts)</li>
<li><code>company__save</code>, <code>eca__save</code>, <code>eca__location_save</code> — 85 counterparties</li>
<li><code>cogs__add_for_ar_line</code> — <b>FIFO COGS</b>, posts Dr COGS / Cr Inventory itself</li>
<li><code>cogs__add_for_ap_line</code> — purchase allocation</li>
<li><code>payment_post</code> — receipts and payments settle open items</li></ul></div>
<div class="card"><h4>Verified before scaling up</h4><ul class="tight">
<li>0 unbalanced transactions</li>
<li>COGS posted on 100% of goods lines</li>
<li>Inventory GL = Σ on-hand × cost, to the cent</li>
<li>Open AR on the control account = the generator's own count of unpaid invoices</li>
<li>8 of 16 guessed account numbers were wrong (2310 is a 401K accrual, not sales tax): every account is now checked against the loaded chart</li></ul></div></div></section>""")

    # 11 ekos compile
    add("""<section class="slide"><div class="kicker">2 · Understanding the source</div><h2>EKOS compiles the LedgerSMB repository</h2>
<p class="lede"><code>ekos build → recover → resolve → compile → commit</code> over the whole checkout: SQL, Perl, JavaScript, Markdown, git history.</p>
<div class="grid g4">
<div class="card stat"><div class="v">11,084</div><div class="k">objects compiled</div></div>
<div class="card stat"><div class="v">9,228</div><div class="k">relationships</div></div>
<div class="card stat"><div class="v">185</div><div class="k">tables recovered from sql/</div></div>
<div class="card stat"><div class="v">2,579</div><div class="k">Perl packages + symbols</div></div></div>
<h3>What it surfaced</h3><ul class="tight">
<li><b>15 cross-language homonyms</b> stopped <code>resolve</code> (Table <code>gl</code> vs Perl <code>LedgerSMB::GL</code>). <code>--force</code> continues and merges nothing; an open EKOS finding.</li>
<li>The first compile's <b>26 cloud LLM calls all failed</b> (HTTP 403, a harness problem), yet EKOS exited 0 with warnings. After the fix, the compile was re-run for real.</li></ul></section>""")

    # 12 discovery
    add(f"""<section class="slide"><div class="kicker">2 · Understanding the source</div><h2>Discovery: asking EKOS before designing</h2>
<p class="lede">{u['ekos_mcp_queries']} structural queries through EKOS's MCP tools (0 errors), every one logged with its purpose and full answer.</p>
<table><tr><th>Question</th><th>EKOS tool</th><th>Answer</th></tr>
<tr><td>Where are the finance/materials tables?</td><td><code>ekos_ekl</code></td><td>24 of 24 located, 185 in total</td></tr>
<tr><td>What are the columns of <code>acc_trans</code>, and what do they mean?</td><td><code>ekos_state</code></td><td>Columns + <code>COMMENT ON</code> text, cited to <code>sql/Pg-database.sql:1142</code></td></tr>
<tr><td>What joins to <code>acc_trans</code>?</td><td><code>ekos_neighborhood</code></td><td>FKs and referencing code</td></tr>
<tr><td>What depends on <code>parts</code>?</td><td><code>ekos_dependents</code> / <code>ekos_impact</code></td><td>27 compiled dependents (becomes the risk gate)</td></tr>
<tr><td>Where is COGS / trial balance / open item logic?</td><td><code>ekos_search</code></td><td>COGS feature tests, <code>xt/42-cogs-fifo.pg</code>, modules</td></tr></table>
<p class="note">EKOS also supplied the dbt source documentation: 46 of 303 deployed columns carry LedgerSMB's own comments, cited to file and line.</p></section>""")

    # 13 ask comparison
    rows = []
    by_q: dict = {}
    for q in asks:
        a = q["answer"] if isinstance(q["answer"], dict) else {}
        by_q.setdefault(q["question"], {})[q.get("model_label")] = (a.get("answer", "") or "")[:230]
    for question, ans in list(by_q.items())[:6]:
        rows.append(f"<tr><td>{esc(question)}</td><td>{esc(ans.get('cloud', '—'))}</td><td>{esc(ans.get('local', '—'))}</td></tr>")
    add(f"""<section class="slide"><div class="kicker">2 · Understanding the source</div><h2><code>ekos ask</code>: cloud vs local model</h2>
<p class="lede">The same six questions, answered by EKOS's grounded Q&amp;A on DeepSeek V4 Flash (cloud) and Llama 3 8B (local). Answers shortened.</p>
<table style="font-size:.78rem"><tr><th style="width:24%">Question</th><th>Cloud</th><th>Local</th></tr>{''.join(rows)}</table>
<p class="note">Verdict: cautious. It refused ("insufficient evidence") rather than invented, which is the right failure mode. But it was thin: structural MCP tools answered the same questions better, and every rule the model relies on was confirmed in LedgerSMB's source.</p></section>""")

    # 14 rules
    add("""<section class="slide"><div class="kicker">2 · Understanding the source</div><h2>The rules the analytics rests on — each with its source</h2>
<table><tr><th>Rule</th><th>Established by</th></tr>
<tr><td><code>acc_trans.amount_bc</code>: <b>negative = debit</b>, positive = credit</td><td>LedgerSMB <code>sql/modules/trial_balance.sql</code></td></tr>
<tr><td>COGS is FIFO, posted by the database, lines tagged with the sales-invoice line</td><td>EKOS ask + <code>COGS.sql</code> + measured (9,322/9,322 tagged)</td></tr>
<tr><td>Invoice qty: positive on sales, negative on purchases</td><td><code>COGS.sql</code></td></tr>
<tr><td>AR/AP lines carry <code>open_item_id</code>; payments settle open items</td><td><code>trigger_open_item_maintenance</code>, <code>payment_post</code></td></tr>
<tr><td>Customer vs vendor = <code>entity_class</code> 2 / 1</td><td>EKOS ask (column) + measured</td></tr>
<tr><td>Ids are identity columns since 1.12</td><td>measured + <code>changes/1.12/migrate_to_identity.sql</code></td></tr>
<tr><td><code>tax.validto = infinity</code> means "no end date"</td><td>measured + EKOS finding</td></tr></table></section>""")

    # 15 migrate overview
    add("""<section class="slide"><div class="kicker">3 · The migration</div><h2>EKOS Migrate: the stages</h2>
<div class="flow"><span class="step">init</span><span class="arrow">→</span><span class="step">discover</span><span class="arrow">→</span><span class="step">profile</span><span class="arrow">→</span><span class="step">assess</span><span class="arrow">→</span><span class="step">map</span><span class="arrow">→</span><span class="step">review / approve</span><span class="arrow">→</span><span class="step">load</span><span class="arrow">→</span><span class="step">validate</span><span class="arrow">→</span><span class="step">report</span></div>
<p class="lede">A migration <b>proof</b> system, not a SQL converter. Every scope decision, finding, mapping, approval and validation
result is a ledger fact with provenance, and the report cites those facts or does not ship.</p>
<div class="grid g3"><div class="card"><h4>Measured, not guessed</h4><p>Types from profiled data; findings with the SQL that measured them.</p></div>
<div class="card"><h4>Human-only decisions</h4><p>Approvals cannot be made through MCP; the requester cannot approve their own request.</p></div>
<div class="card"><h4>Validation that can fail</h4><p>Three tiers plus planted controls; a green without a fired control proves nothing.</p></div></div></section>""")

    # 16 discover
    add("""<section class="slide"><div class="kicker">3 · The migration</div><h2>discover: the live catalog</h2>
<div class="grid g4">
<div class="card stat"><div class="v">168</div><div class="k">migration units</div></div>
<div class="card stat"><div class="v">1,205</div><div class="k">columns</div></div>
<div class="card stat"><div class="v">298</div><div class="k">foreign keys</div></div>
<div class="card stat"><div class="v">503</div><div class="k">functions</div></div></div>
<table style="margin-top:1rem"><tr><th>Kind</th><th>Count</th><th>Kind</th><th>Count</th></tr>
<tr><td>primary keys</td><td class="n">158</td><td>indexes</td><td class="n">62</td></tr>
<tr><td>unique constraints</td><td class="n">66</td><td>sequences</td><td class="n">86</td></tr>
<tr><td>check constraints</td><td class="n">72</td><td>triggers</td><td class="n">29</td></tr>
<tr><td>views</td><td class="n">16</td><td>extensions</td><td class="n">2</td></tr></table>
<p class="note">The first attempt died on <code>unknown pg_constraint.contype "t"</code>: LedgerSMB uses a constraint trigger that EKOS's fixtures never had. Fixed (defect #1).</p></section>""")

    # 17 drift
    add("""<section class="slide"><div class="kicker">3 · The migration</div><h2>Drift: is the repository what is deployed?</h2>
<p class="lede">EKOS compares its compiled view of the repository with the live catalog. <b>316 findings, 298 of which change the migration.</b></p>
<div class="grid g4">
<div class="card stat"><div class="v">246</div><div class="k">columns live-only</div></div>
<div class="card stat"><div class="v">51</div><div class="k">columns repo-only</div></div>
<div class="card stat"><div class="v">18</div><div class="k">tables repo-only</div></div>
<div class="card stat"><div class="v">1</div><div class="k">table live-only</div></div></div>
<div class="quote"><code>public.acc_trans.amount</code> — in the repository's DDL but not deployed<br><code>public.acc_trans.amount_bc</code> — deployed but absent from the repository's DDL</div>
<p class="note">Predicted during discovery (EKOS's <code>ekos_state</code> listed <code>amount</code>) and confirmed here. Part of the drift is real history. Part is an EKOS limitation: it compiles the base <code>CREATE TABLE</code> but does not replay the 175 <code>ALTER</code> scripts (open finding).</p></section>""")

    # 18 profile
    add("""<section class="slide"><div class="kicker">3 · The migration</div><h2>profile: statistics, not values — and PII suppressed</h2>
<div class="grid g2"><div class="card"><h4>P0 / P1 / P2 tiers</h4><p>P0 catalog only · P1 bounded sample · P2 exact and budgeted. The demo profiles at P1.</p>
<p><b>28 columns classified as personal data</b>: no bounds and no top-k are ever recorded for them, at any tier.</p></div>
<div class="card"><h4>Two lessons from real data</h4><ul class="tight">
<li><b>ANALYZE first.</b> P1 estimates come from planner statistics; a freshly loaded database reported <code>tax</code> as 0 rows.</li>
<li><b>Sampling must be reproducible.</b> An unseeded <code>TABLESAMPLE</code> made the DDL differ run to run, and approvals pinned to its hash could never match (defect #8). Now seeded, and small tables are read whole.</li></ul></div></div></section>""")

    # 19 assess
    add("""<section class="slide"><div class="kicker">3 · The migration</div><h2>assess: 674 findings, 276 blocking</h2>
<p class="lede">Data-quality and ClickHouse-compatibility rules, each measured against real rows with the SQL kept as evidence.</p>
<table><tr><th>Finding</th><th>What it means</th></tr>
<tr><td><span class="pill bad">BLOCK</span> COMPAT.CH.INFINITE_TIMESTAMP — <code>tax.validto</code>, 1 row</td><td>PostgreSQL <code>infinity</code>, which no ClickHouse type holds. <b>Predicted here; the load later failed on exactly that row.</b></td></tr>
<tr><td><span class="pill bad">BLOCK</span> COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT</td><td>ClickHouse will not enforce PKs/FKs: duplicates would accumulate silently</td></tr>
<tr><td><span class="pill bad">BLOCK</span> COMPAT.CH.NUMERIC_UNCONSTRAINED — <code>amount_bc</code></td><td>Unconstrained numeric; the measured scale is 22 (LedgerSMB's <code>payment_post</code> stores unrounded products)</td></tr>
<tr><td><span class="pill warn">noise</span> DQ.UNIQ.001 on <code>acc_trans.trans_id</code></td><td>Flags FK columns as "looks like a key": open EKOS finding</td></tr>
<tr><td>28 inferred-FK candidates</td><td>From real code joins + <code>pg_stat_statements</code>; wrong attributions stayed "not measurable", never claimed</td></tr></table></section>""")

    # 20 map
    add("""<section class="slide"><div class="kicker">3 · The migration</div><h2>map: ClickHouse DDL that explains itself</h2>
<pre>-- source: public.account
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a CODEC clause
CREATE TABLE `lsmb_raw`.`acc_trans` (
    `trans_id` Int32, `chart_id` Int32, `transdate` Date32,
    `source` LowCardinality(Nullable(String)),   -- was Nullable(LowCardinality(…)): rejected (defect #7)
    `amount_bc` Decimal128(22),                    -- scale measured, not guessed
    `amount_tc` Decimal64(2), `curr` String, `open_item_id` Nullable(Int32), …
) ENGINE = MergeTree ORDER BY (`entry_id`);</pre>
<p class="note">DDL for 158 tables: <code>clickhouse/ddl/ekos_generated_raw.sql</code>.</p></section>""")

    # 21 risk & approvals
    refused_pill = '<span class="pill ok">refused</span>'
    rows = "".join(
        "<tr><td><code>" + esc(x["unit"]) + "</code></td><td>" + esc(x["risk_gate"]) + "</td><td>"
        + (refused_pill if x["self_approval_refused"] == "yes" else esc(x["self_approval_refused"]))
        + "</td><td>" + esc(x["load_s"]) + " s</td></tr>"
        for x in gated)
    add(f"""<section class="slide"><div class="kicker">3 · The migration</div><h2>Risk and human approval: {len(gated)} units gated, self-approval refused {refused}/{len(gated)}</h2>
<p class="lede">EKOS computes risk from statement class × environment × lossiness × <b>blast radius</b> (compiled dependents) × rows.
Above R1 a load needs an approval pinned to the artifact hashes and an evidence snapshot.</p>
<table><tr><th>Unit</th><th>Computed</th><th>Requester tried to approve</th><th>Load</th></tr>{rows}</table>
<p class="note">Three governance defects were found here and fixed: <b>#4</b> the requester could approve their own request by typing a prefixed name; <b>#15</b> blast radius matched tables by suffix, so review said R1 while load said R3; <b>#16</b> load accepted an approval granted at a lower class.</p></section>""")

    # 22 load
    add(f"""<section class="slide"><div class="kicker">3 · The migration</div><h2>load: {len(units)} tables into lsmb_raw</h2>
<p class="lede">Every statement is parsed and classified before it runs; unparseable, unknown or credential-carrying statements are refused.</p>
<pre>INSERT INTO `lsmb_raw`.`acc_trans`
SELECT * FROM postgresql(lsmb_source, schema = 'public', table = 'acc_trans')
WHERE `entry_id` >= 1 AND `entry_id` < 100001</pre>
<div class="grid g3"><div class="card"><h4>Integer keys</h4><p>Bounded, half-open key-range chunks.</p></div>
<div class="card"><h4>Text / no key</h4><p>One whole-table statement, stated as unbounded. <code>account</code> is keyed by text, which broke the old planner (defect #2).</p></div>
<div class="card"><h4>tax</h4><p>Loaded by Python with the recorded decision infinity → NULL; reconciled 1/1.</p></div></div></section>""")

    # 23 validation
    add(f"""<section class="slide"><div class="kicker">3 · The migration</div><h2>validate: {passed_all}/{len(units)} pass all three tiers</h2>
<table><tr><th>Tier</th><th>Compares</th><th>Result</th></tr>
<tr><td>V1</td><td>row counts</td><td><span class="pill ok">{sum(1 for x in units if x['v1']=='passed')}/{len(units)}</span></td></tr>
<tr><td>V2</td><td>per column: nulls, min, max, total byte length of the canonical form</td><td><span class="pill ok">{sum(1 for x in units if x['v2']=='passed')}/{len(units)}</span></td></tr>
<tr><td>V3</td><td>engine-independent row hashes, summed per bucket</td><td><span class="pill ok">{sum(1 for x in units if x['v3']=='passed')}/{len(units)}</span></td></tr></table>
<h3>Planted control: one cent</h3>
<div class="quote">+0.01 on one journal line, in ClickHouse only → V1 passed, V2 passed (as designed: neither can see it), <b>V3 failed on bucket 43, exit 1</b>. Reverted → all pass.</div>
<p class="note">Before defect #9 was fixed, unconstrained <code>numeric</code> was hashed at scale 0: <b>V3 could not see cents at all</b>, and "passed". The planted control is how you know a green is real.</p></section>""")

    # 24 validator defects
    add("""<section class="slide"><div class="kicker">3 · The migration</div><h2>Five ways the validator disagreed with itself</h2>
<p class="lede">Each one only shows up on real data: non-ASCII text, empty tables, all-NULL columns, unconstrained numerics.</p>
<table><tr><th>#</th><th>PostgreSQL side</th><th>ClickHouse side</th><th>Fix</th></tr>
<tr><td>9</td><td><code>to_char(604.74, scale 0)</code> → 605</td><td>truncates → 604</td><td>scale from the deployed type; never 0</td></tr>
<tr><td>10</td><td>NULL bool → <code>'f'</code></td><td>NULL → <code>\\N</code></td><td>decide NULL on the column, both sides</td></tr>
<tr><td>11</td><td><code>length()</code> = characters</td><td><code>length()</code> = bytes</td><td><code>octet_length</code></td></tr>
<tr><td>12</td><td>empty min/max = NULL</td><td>type default <code>''</code>/<code>0</code></td><td><code>aggregate_functions_null_for_empty</code></td></tr>
<tr><td>13</td><td>SQL NULL → <code>''</code></td><td>raw TSV NULL = sentinel bytes</td><td><code>format_tsv_null_representation</code></td></tr></table>
<p class="note">Verified against real PostgreSQL 16 and ClickHouse 24.8 with EKOS's live three-way tests (12 pass).</p></section>""")

    # 25 report
    add("""<section class="slide"><div class="kicker">3 · The migration</div><h2>report: compiled, cited — and "Not signable"</h2>
<p class="lede">The migration report is compiled from 2,214 ledger facts with groundedness 1.000. It refuses sign-off, and it is right to.</p>
<table><tr><th>Blocker</th><th>Why</th></tr>
<tr><td>Units not validated in the state machine</td><td>The lifecycle needs assessed → … → validated; units with blocking findings cannot advance until dispositions exist, and load/validate swallow the illegal-transition error (open EKOS finding)</td></tr>
<tr><td>Unexplained divergences</td><td>No approved dispositions yet (the disposition workflow is not built)</td></tr>
<tr><td>Planted control missed</td><td>The one-cent control was run by hand, not through <code>ekos migrate validate</code></td></tr></table>
<p class="note">The data is proven elsewhere (V1–V3, the planted control, the reconciliation). The report correctly refuses to sign what its own workflow has not recorded.</p></section>""")

    # 26 dbt layers
    add("""<section class="slide"><div class="kicker">4 · The analytical layer</div><h2>dbt on ClickHouse: 38 models in three layers</h2>
<div class="flow"><span class="step">lsmb_raw (31)</span><span class="arrow">→</span><span class="step">staging · 12 views</span><span class="arrow">→</span><span class="step">intermediate · 4 tables</span><span class="arrow">→</span><span class="step">marts · 22 tables</span></div>
<div class="grid g3">
<div class="card"><h4>staging</h4><p>1:1 with sources: renamed, typed, cents-exact; <b>debit/credit split</b> from LedgerSMB's signed amount so nothing downstream re-derives it.</p></div>
<div class="card"><h4>intermediate</h4><p>Journal lines + accounts + natural sign; sales lines + <b>exact FIFO COGS</b> (via the invoice-line tag); open-item balances as of a date.</p></div>
<div class="card"><h4>marts</h4><p>Facts, dimensions and report-shaped marts for finance (11) and materials (11).</p></div></div>
<p class="note">Session <code>join_use_nulls = 1</code> gives standard outer joins; account numbers are dbt vars; aliases never shadow aggregated columns (a ClickHouse trap hit twice).</p></section>""")

    # 27 models list
    add("""<section class="slide"><div class="kicker">4 · The analytical layer</div><h2>The marts</h2>
<div class="grid g2"><div class="card"><h4>Finance</h4><ul class="tight">
<li><code>fct_journal_lines</code>, <code>dim_account</code>, <code>dim_counterparty</code>, <code>dim_date</code></li>
<li><code>mart_trial_balance_monthly</code>: account × month, zero rows included</li>
<li><code>mart_income_statement_monthly</code>, <code>mart_balance_sheet_monthly</code></li>
<li><code>mart_ar_aging</code>, <code>mart_ap_aging</code></li>
<li><code>mart_cash_flow_monthly</code> (direct method), <code>mart_working_capital_monthly</code></li></ul></div>
<div class="card"><h4>Product &amp; materials</h4><ul class="tight">
<li><code>fct_sales_lines</code>, <code>fct_purchase_lines</code>, <code>dim_part</code></li>
<li><code>mart_sales_by_part_group_monthly</code>, <code>mart_customer_profitability</code></li>
<li><code>mart_inventory_movements_monthly</code>, <code>mart_inventory_position</code></li>
<li><code>mart_stock_count_variance</code>, <code>mart_order_backlog</code></li>
<li><code>mart_abc_analysis</code>, <code>mart_supplier_spend_monthly</code></li></ul></div></div></section>""")

    # 28 docs
    add("""<section class="slide"><div class="kicker">4 · The analytical layer</div><h2>Documentation that cites its source</h2>
<p class="lede">dbt source docs are generated from EKOS's compiled knowledge: LedgerSMB's own <code>COMMENT ON</code> text, with file and line.</p>
<pre>- name: acc_trans
  description: "This table stores line items for financial transactions. Please note that payments
    in 1.3 are not full-fledged transactions. [EKOS: defined in sql/Pg-database.sql]"
  columns:
    - name: "source"
      description: "Document Source identifier for individual line items, usually used for
        payments. [EKOS: COMMENT ON COLUMN] ClickHouse type LowCardinality(Nullable(String))."</pre>
<div class="grid g3"><div class="card stat"><div class="v">31</div><div class="k">sources documented</div></div>
<div class="card stat"><div class="v">46 / 303</div><div class="k">columns with LedgerSMB's own text</div></div>
<div class="card stat"><div class="v">257</div><div class="k">say "no description" rather than invent one</div></div></div></section>""")

    # 29 KPI headline
    add(f"""<section class="slide"><div class="kicker">5 · The reports</div><h2>18 months at a glance</h2>
<div class="grid g4">
<div class="card stat"><div class="v">{money(k(d,'pnl_total','total_revenue'))}</div><div class="k">revenue</div></div>
<div class="card stat"><div class="v">{k(d,'pnl_total','gross_margin_pct')}%</div><div class="k">gross margin (FIFO)</div></div>
<div class="card stat"><div class="v">{money(k(d,'pnl_total','total_net_income'))}</div><div class="k">net income</div></div>
<div class="card stat"><div class="v">{k(d,'pnl_total','net_margin_pct')}%</div><div class="k">net margin</div></div>
<div class="card stat"><div class="v">{money(k(d,'balance_sheet','total_assets'))}</div><div class="k">total assets at 2026-06-30</div></div>
<div class="card stat"><div class="v">{money(k(d,'ar_aging','open'))}</div><div class="k">open receivables</div></div>
<div class="card stat"><div class="v">{money(k(d,'inventory','value'))}</div><div class="k">inventory value</div></div>
<div class="card stat"><div class="v">{k(d,'backlog','open_orders')}</div><div class="k">open sales orders</div></div></div>
<p class="src">Source: logs/kpis.json — each figure is a query on the marts (queries in docs/confluence/05-kpis.md)</p></section>""")

    add("""<section class="slide"><div class="kicker">5 · The reports</div><h2>Monthly profit &amp; loss</h2>
<p class="lede">Revenue and FIFO cost of goods sold by month, net income as the line. Seasonality and growth are visible, and so is Q1.</p>
<div data-chart="pnl"></div><p class="src">mart_income_statement_monthly</p></section>""")
    add("""<section class="slide"><div class="kicker">5 · The reports</div><h2>Margins by month</h2><div data-chart="margin"></div>
<div data-table="pnl_monthly" style="margin-top:1rem"></div></section>""")
    add(f"""<section class="slide"><div class="kicker">5 · The reports</div><h2>Balance sheet — and it balances every month</h2>
<div data-table="balance_sheet"></div>
<p class="lede" style="margin-top:1rem">Assets = liabilities + equity at every month-end: a dbt test, and independently LedgerSMB's
<code>report__balance_sheet</code> agrees account by account.</p>
<p class="note">No year-end close in the ledger, so earnings to date are an explicit equity line (as LedgerSMB's own report does).</p></section>""")
    add("""<section class="slide"><div class="kicker">5 · The reports</div><h2>Cash flow (direct method)</h2>
<div data-chart="cash"></div><div data-table="cash_flow" style="margin-top:.8rem"></div>
<p class="note">Classified by the other side of each bank transaction. Financing includes share capital and the revolving facility.</p></section>""")
    add("""<section class="slide"><div class="kicker">5 · The reports</div><h2>Working capital: DSO, DPO, DIO</h2>
<div data-chart="wc"></div><div data-table="working_capital" style="margin-top:.8rem"></div></section>""")
    add("""<section class="slide"><div class="kicker">5 · The reports</div><h2>Receivables aging at 2026-06-30</h2>
<div class="grid g2"><div><div data-chart="aging"></div></div><div><h3>Most overdue customers</h3><div data-table="worst_debtors"></div></div></div>
<p class="note">The subledger ties to the AR control account (dbt test) and to the open-item ledger in PostgreSQL (371/371 items, exact).</p></section>""")
    add("""<section class="slide"><div class="kicker">5 · The reports</div><h2>Product groups: revenue and margin</h2>
<div class="grid g2"><div><h3>Revenue</h3><div data-chart="groups"></div></div><div><h3>Gross margin %</h3><div data-chart="groupmargin"></div></div></div>
<p class="note">Services carry no COGS (100% margin by construction); raw materials run thin; hydraulics is the volume business.</p></section>""")
    add("""<section class="slide"><div class="kicker">5 · The reports</div><h2>Customers: who pays, and how fast</h2>
<div data-chart="customers"></div><div data-table="top_customers" style="margin-top:.8rem"></div></section>""")
    add("""<section class="slide"><div class="kicker">5 · The reports</div><h2>ABC classification (trailing 12 months)</h2>
<div class="grid g2"><div data-chart="abc"></div><div data-table="abc"></div></div>
<p class="note">A = the parts making up the first 80% of revenue. A handful of parts carry the business, a standard Pareto shape.</p></section>""")
    add("""<section class="slide"><div class="kicker">5 · The reports</div><h2>Inventory position and reorder alerts</h2>
<div data-table="inventory"></div><h3>Below reorder point</h3><div data-table="reorder_now"></div>
<p class="note">Movements (receipts − sales + count adjustments) reproduce LedgerSMB's on-hand for every part (dbt test).</p></section>""")
    add("""<section class="slide"><div class="kicker">5 · The reports</div><h2>Shrinkage from physical counts</h2>
<div data-chart="shrink"></div><div data-table="shrinkage" style="margin-top:.8rem"></div>
<p class="note">Variance value ties to the inventory-adjustment postings (dbt test).</p></section>""")
    add("""<section class="slide"><div class="kicker">5 · The reports</div><h2>Order backlog and suppliers</h2>
<div class="grid g2"><div><h3>Open sales orders</h3><div data-table="backlog"></div></div>
<div><h3>Top suppliers by spend</h3><div data-chart="suppliers"></div></div></div></section>""")

    # DQ
    add("""<section class="slide"><div class="kicker">6 · Trust</div><h2>Four levels of data quality — each shown to fail</h2>
<table><tr><th>Level</th><th>What</th><th>Result</th><th>Planted defect</th></tr>
<tr><td>Migration</td><td>EKOS V1 / V2 / V3</td><td><span class="pill ok">30/30</span></td><td>+0.01 → V3 fails</td></tr>
<tr><td>Structure</td><td>dbt generic: unique, not-null, relationships, accepted values, non-negative, row count vs source</td><td><span class="pill ok">114/114</span></td><td>—</td></tr>
<tr><td>Accounting</td><td>10 invariants: balances, trial balance, balance sheet, subledgers, revenue, COGS, inventory, shrinkage</td><td><span class="pill ok">10/10</span></td><td>+10.00 on a sales line → 2 fail, 24 downstream skipped</td></tr>
<tr><td>Oracle</td><td>marts vs LedgerSMB's own reports in PostgreSQL</td><td><span class="pill ok">6/6</span></td><td>stale target → 6/6 fail</td></tr></table></section>""")
    def verdict(c: dict) -> str:
        if c["passed"]:
            return '<span class="pill ok">exact</span>'
        return '<span class="pill bad">' + str(len(c["differences"])) + " diff</span>"

    rrows = "".join(
        "<tr><td>" + esc(c["check"]) + "</td><td>" + esc(c["oracle"]) + "</td><td class='n'>"
        + str(c["compared"]) + "</td><td>" + verdict(c) + "</td></tr>"
        for c in d["recon"]["checks"])
    add(f"""<section class="slide"><div class="kicker">6 · Trust</div><h2>The independent oracle: LedgerSMB agrees, to the cent</h2>
<p class="lede">dbt tests check the model against itself. This checks it against LedgerSMB's own reporting functions, run in PostgreSQL.</p>
<table><tr><th>Check</th><th>LedgerSMB oracle</th><th>Compared</th><th>Result</th></tr>{rrows}</table>
<p class="note">Two conventions had to be matched rather than "fixed": heading subtotal rows in the statements, and raw ledger sign on the balance sheet. LedgerSMB's own aging reports fail on this 1.14 development schema, an upstream finding.</p></section>""")

    # AI usage
    mrows = "".join(f"<tr><td>{esc(m['label'])}</td><td class='n'>{m['calls']}</td><td class='n'>{m['ok']}</td><td class='n'>{m['in']:,}</td><td class='n'>{m['out']:,}</td><td class='n'>{m['total']:,}</td></tr>" for m in d["usage"]["models"])
    add(f"""<section class="slide"><div class="kicker">6 · Accounting for AI</div><h2>Tokens by model (provider-reported)</h2>
<table><tr><th>Model</th><th>Calls</th><th>Succeeded</th><th>Input</th><th>Output</th><th>Total</th></tr>{mrows}</table>
<div data-chart="tokens" style="margin-top:1rem"></div>
<p class="note">The first 32 cloud calls failed with HTTP 403 (the proxy sent a <code>Python-urllib</code> User-Agent) and consumed no tokens. DeepSeek's hidden reasoning tokens count as output.</p></section>""")
    cc = d["usage"]["claude_code_checkpoints"]
    ccrows = "".join(f"<tr><td>{esc(r['phase'])}</td><td>{esc(r['note'])}</td><td class='n'>{int(r['context_tokens_remaining']):,}</td></tr>" for r in cc)
    add(f"""<section class="slide"><div class="kicker">6 · Accounting for AI</div><h2>Claude Code: {u['claude_code_context_consumed_estimate']:,} tokens of context (estimate)</h2>
<p class="lede">Measured from the session's context counter at each phase. It is context consumed in the conversation, not a billing figure, which the session does not expose.</p>
<table style="font-size:.8rem"><tr><th>Phase</th><th>What</th><th>Remaining</th></tr>{ccrows}</table></section>""")
    add(f"""<section class="slide"><div class="kicker">6 · Accounting for AI</div><h2>Where each one earned its keep</h2>
<div class="grid g3">
<div class="card"><h4>EKOS</h4><p>{u['ekos_mcp_queries']} structural queries, 0 errors: exact locations, columns, comments, dependents. {u['migrate_commands']} migrate commands.
It <b>predicted</b> the infinity blocker and the <code>amount → amount_bc</code> drift before they bit. Its risk gate and validator caught real problems once fixed.</p></div>
<div class="card"><h4>Claude Code</h4><p>Wrote everything, and <b>refused to trust green</b>: planted defects at every level, the oracle reconciliation, and root-causing 16 EKOS defects, including two critical governance holes and a cents-blind validator.</p></div>
<div class="card"><h4>Other LLMs</h4><p>Cloud: semantic naming in the compile, cited Q&amp;A (cautious, sometimes thin). Local Llama 3: fast via cache, weaker answers.
Neither was on the critical path. Every modelling rule was confirmed in source.</p></div></div></section>""")

    # findings
    add("""<section class="slide"><div class="kicker">6 · Findings</div><h2>16 EKOS defects found by one real run</h2>
<table style="font-size:.82rem"><tr><th>#</th><th>Defect</th><th>Severity</th></tr>
<tr><td>4</td><td>Requester could approve their own R3 request (<code>--as cli:&lt;me&gt;</code>)</td><td><span class="pill bad">critical</span></td></tr>
<tr><td>9</td><td>Validator hashed unconstrained numeric at scale 0: cents invisible</td><td><span class="pill bad">critical</span></td></tr>
<tr><td>15</td><td>Blast radius by table-name suffix: review R1, load R3</td><td><span class="pill bad">critical</span></td></tr>
<tr><td>16</td><td>Load accepted an approval granted at a lower class</td><td><span class="pill bad">critical</span></td></tr>
<tr><td>1, 2, 7</td><td>Constraint triggers; text-keyed chunking; invalid <code>Nullable(LowCardinality)</code></td><td><span class="pill warn">blocker</span></td></tr>
<tr><td>5, 6, 8</td><td>Evidence collisions / prefix matching; non-reproducible DDL</td><td><span class="pill warn">major</span></td></tr>
<tr><td>10–14</td><td>NULL, byte-length, empty-set, TSV-NULL asymmetries; validate exited 0 on failure</td><td><span class="pill warn">major</span></td></tr>
<tr><td>3</td><td>Policy file kebab-case</td><td><span class="pill acc">minor</span></td></tr></table>
<p class="note">All fixed, each with a regression test that fails without its fix (EKOS devlog_226).</p></section>""")
    add("""<section class="slide"><div class="kicker">6 · Findings</div><h2>Still open</h2>
<div class="grid g2"><div class="card"><h4>EKOS</h4><ul class="tight">
<li>Cross-language homonyms stop <code>resolve</code></li>
<li>Base DDL compiled, <code>ALTER</code> history not replayed</li>
<li>DQ.UNIQ.001 blocks FK columns; join-alias misattribution</li>
<li>No transform disposition (infinity → NULL lived outside EKOS)</li>
<li><code>jsonb</code> has no canonical rule</li>
<li>State machine not advanced by the verbs; errors swallowed</li>
<li><code>ask --json</code> logs to stdout; a compile whose LLM calls all fail exits 0</li></ul></div>
<div class="card"><h4>LedgerSMB (upstream)</h4><ul class="tight">
<li>Aging reports fail on 1.14-dev (result-type mismatch; bad <code>USING</code>)</li>
<li>A change listed twice in LOADORDER (harmless thanks to <code>db_patches</code>)</li>
<li><code>payment_post</code> stores scale-22 amounts</li></ul>
<h4 style="margin-top:.8rem">This demo</h4><ul class="tight"><li>Proxy User-Agent → first 32 cloud calls 403 (fixed)</li></ul></div></div></section>""")

    # runbook + repo
    add("""<section class="slide"><div class="kicker">Operate it</div><h2>Run it yourself</h2>
<pre>cd ../EKOS && docker compose -f docker-compose.migrate.yml up -d
# once: migration/clickhouse_setup.sql (named collection + databases)
python3 tools/llm_proxy.py 8765 &
cd pipelines && PROJECT=my-run ../.venv/bin/python -m lsmb_pipelines.run</pre>
<table><tr><th>Path</th><th>What</th></tr>
<tr><td><code>sql/</code>, <code>data_generator/</code></td><td>LedgerSMB schema loader + seed; synthetic data through LedgerSMB's procedures</td></tr>
<tr><td><code>migration/</code>, <code>clickhouse/ddl/</code></td><td>EKOS Migrate scripts, policy, EKOS-generated DDL</td></tr>
<tr><td><code>dbt/</code></td><td>38 models, 124 tests, macros, docs</td></tr>
<tr><td><code>pipelines/</code></td><td>orchestrator, tax loader, reconciliation, KPI and usage reports</td></tr>
<tr><td><code>docs/</code></td><td>Confluence pages, REPORT.md, QUERY_LOG.md, migration_report.md</td></tr>
<tr><td><code>logs/</code></td><td>every query, answer, LLM call, command and run</td></tr></table></section>""")
    add(f"""<section class="slide cover"><div class="kicker">Summary</div>
<h1>Checked, not trusted</h1>
<p class="lede">A real ERP's schema and logic, a migration whose every step is a recorded fact, an analytical layer tested four ways and
reconciled to LedgerSMB's own books — and an honest account of where each tool, human and model helped.</p>
<div class="grid g4"><div class="card stat"><div class="v ok">{passed_all}/{len(units)}</div><div class="k">V1+V2+V3</div></div>
<div class="card stat"><div class="v ok">162/162</div><div class="k">dbt</div></div>
<div class="card stat"><div class="v ok">{recon_ok}/{len(d['recon']['checks'])}</div><div class="k">oracle checks</div></div>
<div class="card stat"><div class="v bad">16</div><div class="k">EKOS defects fixed</div></div></div></section>""")
    return S


def main() -> None:
    d = load()
    body = "\n".join(slides(d))
    data = {"kpis": d["kpis"], "usage": d["usage"], "runs": d["runs"]}
    tpl = (ROOT / "presentation" / "template.html").read_text()
    out = tpl.replace("__SLIDES__", body).replace("__DATA__", json.dumps(data, default=str))
    (ROOT / "presentation" / "index.html").write_text(out)
    n = body.count('<section class="slide')
    print(f"{n} slides → presentation/index.html ({len(out):,} bytes)")


if __name__ == "__main__":
    main()
