#!/usr/bin/env bash
# Compile the LedgerSMB sources with EKOS: build → recover → resolve → compile → commit.
# Each stage's wall time and full output go to logs/ekos_pipeline.log. The cloud LLM goes through
# tools/llm_proxy.py (see ekos/ledgersmb-demo.toml), so every call lands in logs/llm_calls.jsonl.
set -uo pipefail
export LC_ALL=C  # decimal point, not the locale's comma, in the wall-time printf
HERE="$(cd "$(dirname "$0")/.." && pwd)"
EKOS=/home/legion/PycharmProjects/EKOS/ekos/target/release/ekos
CFG="$HERE/ekos/ledgersmb-demo.toml"
LOG="$HERE/logs/ekos_pipeline.log"
cd /home/legion/PycharmProjects/LedgerSMB

echo "# ekos pipeline over LedgerSMB — $(date -u +%FT%TZ) — $($EKOS --version)" >>"$LOG"
# START=<stage> resumes mid-pipeline.
stages=(build recover resolve compile commit)
while [ -n "${START:-}" ] && [ "${stages[0]}" != "$START" ]; do stages=("${stages[@]:1}"); done
for stage in "${stages[@]}"; do
  start=$(date +%s.%N)
  echo "## $stage" >>"$LOG"
  extra=()
  [ "$stage" = commit ] && extra=(--yes)   # only `commit` takes --yes
  # resolve: LedgerSMB has 15 cross-language homonyms (Table `gl` vs PerlPackage LedgerSMB::GL, JS
  # vs Perl `initialize`). The detector reports them and stops; --force only continues — nothing is
  # merged (resolve.rs::check_conflicts). Recorded as a finding in docs/REPORT.md.
  [ "$stage" = resolve ] && extra=(--force)
  "$EKOS" --config "$CFG" "$stage" "${extra[@]}" >>"$LOG" 2>&1
  rc=$?
  end=$(date +%s.%N)
  printf '## %s finished rc=%s in %.1fs\n' "$stage" "$rc" "$(echo "$end - $start" | bc)" >>"$LOG"
  [ $rc -ne 0 ] && { echo "stage $stage failed (rc=$rc)" >>"$LOG"; exit $rc; }
done
"$EKOS" --config "$CFG" status >>"$LOG" 2>&1
echo "## done $(date -u +%FT%TZ)" >>"$LOG"
