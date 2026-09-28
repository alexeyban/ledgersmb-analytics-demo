#!/usr/bin/env bash
# EKOS Migrate (RFC 0154-0162) over the LedgerSMB database: every command and its full output go to
# logs/migration.log with a timestamp and wall time. Credentials come from environment variables the
# config only names (LSMB_PG_PASSWORD / LSMB_CH_PASSWORD) and never reach the ledger.
#
#   migration/ekos_migrate.sh <migrate subcommand> [args...]
set -uo pipefail
export LC_ALL=C  # decimal point, not the locale's comma, in the wall-time printf
HERE="$(cd "$(dirname "$0")/.." && pwd)"
EKOS=/home/legion/PycharmProjects/EKOS/ekos/target/release/ekos
CFG="$HERE/ekos/ledgersmb-demo.toml"
LOG="$HERE/logs/migration.log"
export LSMB_PG_PASSWORD=ekos-local-only LSMB_CH_PASSWORD=ekos-local-only
cd /home/legion/PycharmProjects/LedgerSMB

start=$(date +%s.%N)
{
  echo
  echo "### $(date -u +%FT%TZ)  ekos migrate $*"
} >>"$LOG"
"$EKOS" --config "$CFG" migrate "$@" 2>&1 | tee -a "$LOG"
rc=${PIPESTATUS[0]}
printf '### exit=%s  wall=%.1fs\n' "$rc" "$(echo "$(date +%s.%N) - $start" | bc)" >>"$LOG"
exit "$rc"
