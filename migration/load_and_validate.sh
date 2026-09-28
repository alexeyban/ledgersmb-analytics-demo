#!/usr/bin/env bash
# Load the analytics-relevant LedgerSMB tables into ClickHouse `lsmb_raw` with EKOS Migrate, then
# validate each at tier V3 (bucketed row hashes, RFC 0156). Every command's output goes to
# logs/migration.log via ekos_migrate.sh; a per-unit summary goes to logs/migration_units.tsv.
#
# Sandbox environment: RFC 0160 requires no approval there (a sandbox is a separate database). The
# approval workflow (RFC 0161) is exercised separately, against the staging environment, in
# migration/approval_demo.sh.
set -uo pipefail
export LC_ALL=C
HERE="$(cd "$(dirname "$0")/.." && pwd)"
SUMMARY="$HERE/logs/migration_units.tsv"

# R3 units (acc_trans, transactions, parts, entity, entity_credit_account, country) go through
# migration/approval_demo.sh; `tax` is loaded by the Python pipeline (its validto holds PostgreSQL
# `infinity`, which EKOS flagged BLOCK COMPAT.CH.INFINITE_TIMESTAMP and which no ClickHouse type holds).
UNITS=(
  # finance
  account account_heading account_link gl ar ap payment open_item
  trans_type currency
  # product & materials
  partsgroup partstax invoice oe oe_class orderitems inventory_report inventory_report_line
  warehouse
  # counterparties
  company entity_class business location eca_to_location
)

printf 'unit\tload_exit\tload_s\tvalidate_exit\tvalidate_s\n' >"$SUMMARY"
for t in "${UNITS[@]}"; do
  s=$(date +%s.%N)
  "$HERE/migration/ekos_migrate.sh" load --unit "public.$t" >/dev/null 2>&1
  le=$?
  m=$(date +%s.%N)
  "$HERE/migration/ekos_migrate.sh" validate --unit "public.$t" --tier v3 >/dev/null 2>&1
  ve=$?
  e=$(date +%s.%N)
  printf '%s\t%s\t%.2f\t%s\t%.2f\n' "$t" "$le" "$(echo "$m - $s" | bc)" "$ve" "$(echo "$e - $m" | bc)" >>"$SUMMARY"
  printf '%-24s load=%s validate=%s\n' "$t" "$le" "$ve"
done
