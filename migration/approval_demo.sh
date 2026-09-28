#!/usr/bin/env bash
# RFC 0161 in action: units whose COMPUTED risk is R3 (blast radius > 10 compiled dependents, or
# > 1000 affected rows) cannot load — not even into the sandbox — without a human approval.
#
# For each such unit: raise a request (review), show that the requester cannot approve their own
# request (acc_trans only, once), approve as a different person with the evidence rendered, then load
# and validate V1-V3. Approver names are demo role labels, not real people.
set -uo pipefail
export LC_ALL=C
HERE="$(cd "$(dirname "$0")/.." && pwd)"
M="$HERE/migration/ekos_migrate.sh"
SUMMARY="$HERE/logs/migration_units.tsv"

R3_UNITS=(acc_trans transactions parts entity entity_credit_account country)

for t in "${R3_UNITS[@]}"; do
  unit="public.$t"
  echo "== $unit"
  "$M" review --unit "$unit" --env sandbox | grep -E "Raised|risk|needs|requester"
  if [ "$t" = acc_trans ]; then
    echo "-- self-approval attempt (must be refused):"
    "$M" approve "REQ:$unit:sandbox" --as cli:legion --show-evidence 2>&1 | tail -2
  fi
  "$M" approve "REQ:$unit:sandbox" --as demo.finance-controller --show-evidence 2>&1 | tail -3
  s=$(date +%s.%N)
  "$M" load --unit "$unit" --env sandbox >/dev/null 2>&1; le=$?
  m=$(date +%s.%N)
  "$M" validate --unit "$unit" --tier v3 >/dev/null 2>&1; ve=$?
  e=$(date +%s.%N)
  printf '%s\t%s\t%.2f\t%s\t%.2f\n' "$t" "$le" "$(echo "$m - $s" | bc)" "$ve" "$(echo "$e - $m" | bc)" >>"$SUMMARY"
  echo "   load=$le validate=$ve"
done
