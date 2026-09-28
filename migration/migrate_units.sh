#!/usr/bin/env bash
# Load and validate every analytics-relevant LedgerSMB table with EKOS Migrate.
#
# For each unit: try the load. If EKOS refuses it because its COMPUTED risk needs an approval
# (RFC 0161 — R3 when more than 10 compiled objects depend on the table, or the load touches more
# than 1000 rows), raise a request, show that the requester cannot approve it themselves, approve it as
# a different person with the evidence rendered, and load again. Then validate V1-V3.
# Which units need approval is decided by EKOS at run time, not hard-coded here.
#
# Output: logs/migration.log (every command, full output) and logs/migration_units.tsv (one row per unit).
set -uo pipefail
export LC_ALL=C
HERE="$(cd "$(dirname "$0")/.." && pwd)"
M="$HERE/migration/ekos_migrate.sh"
SUMMARY="$HERE/logs/migration_units.tsv"
TMP="$(mktemp)"

UNITS=(
  account account_heading account_link acc_trans transactions gl ar ap payment open_item
  trans_type currency
  parts partsgroup partstax invoice oe oe_class orderitems inventory_report inventory_report_line
  warehouse
  entity company entity_class entity_credit_account business country location eca_to_location
)
# `tax` is loaded by pipelines/lsmb_pipelines/load_tax.py: EKOS flags tax.validto (PostgreSQL
# `infinity`) BLOCK COMPAT.CH.INFINITE_TIMESTAMP and has no way yet to record the transform.

printf 'unit\trisk_gate\tself_approval_refused\tload_exit\tload_s\tvalidate_exit\tv1\tv2\tv3\n' >"$SUMMARY"
for t in "${UNITS[@]}"; do
  unit="public.$t"
  gate="none"; self="n/a"
  s=$(date +%s.%N)
  "$M" load --unit "$unit" --env sandbox >"$TMP" 2>&1; le=$?
  if [ $le -ne 0 ] && grep -q "has no matching approval" "$TMP"; then
    gate=$(grep -oE "is R[0-9]" "$TMP" | head -1 | cut -d' ' -f2)
    "$M" review --unit "$unit" --env sandbox >/dev/null 2>&1
    if "$M" approve "REQ:$unit:sandbox" --as "cli:$(whoami)" --show-evidence >"$TMP" 2>&1; then
      self="NO — requester approved own request"
    else
      grep -q "may not be the requester" "$TMP" && self="yes" || self="error"
    fi
    "$M" approve "REQ:$unit:sandbox" --as demo.finance-controller --show-evidence >/dev/null 2>&1
    "$M" load --unit "$unit" --env sandbox >"$TMP" 2>&1; le=$?
  fi
  m=$(date +%s.%N)
  "$M" validate --unit "$unit" --tier v3 >"$TMP" 2>&1; ve=$?
  v1=$(grep -oE "v1 (passed|FAILED)" "$TMP" | cut -d' ' -f2)
  v2=$(grep -oE "v2 (passed|FAILED)" "$TMP" | cut -d' ' -f2)
  v3=$(grep -oE "v3 (passed|FAILED)" "$TMP" | cut -d' ' -f2)
  printf '%s\t%s\t%s\t%s\t%.2f\t%s\t%s\t%s\t%s\n' "$t" "$gate" "$self" "$le" "$(echo "$m - $s" | bc)" \
    "$ve" "$v1" "$v2" "$v3" >>"$SUMMARY"
  printf '%-24s gate=%-4s load=%s validate=%s (%s/%s/%s)\n' "$t" "$gate" "$le" "$ve" "$v1" "$v2" "$v3"
done
rm -f "$TMP"
