#!/usr/bin/env bash
# Build a LedgerSMB database in the local PostgreSQL sandbox from LedgerSMB's OWN sql/ tree, in
# the order LedgerSMB itself uses:
#   1. sql/Pg-database.sql                  base schema
#   2. sql/changes/LOADORDER                schema changes; a leading '!' marks a legacy fix whose
#                                           errors LedgerSMB itself tolerates
#   3. sql/modules/LOADORDER                stored procedures, views, triggers
#
# Every file's outcome is written to logs/schema_load.tsv, so nothing that failed is hidden.
#
# Usage: sql/load_ledgersmb_schema.sh [path-to-LedgerSMB-checkout]
set -uo pipefail

LSMB="${1:-/home/legion/PycharmProjects/LedgerSMB}"
HERE="$(cd "$(dirname "$0")/.." && pwd)"
LOG="$HERE/logs/schema_load.tsv"
export PGHOST=127.0.0.1 PGPORT=55432 PGUSER=ekos PGPASSWORD=ekos-local-only
DB=ledgersmb

psql -d postgres -qc "DROP DATABASE IF EXISTS $DB" >/dev/null
psql -d postgres -qc "CREATE DATABASE $DB TEMPLATE template0 ENCODING 'UTF8'" >/dev/null
psql -d "$DB" -qc "CREATE EXTENSION IF NOT EXISTS pg_stat_statements" >/dev/null

printf 'stage\tfile\ttolerated\tresult\tfirst_error\n' >"$LOG"

declare -A APPLIED  # content sha -> 1, like LedgerSMB's db_patches: a change listed twice in
                    # LOADORDER (1.6/drop_arap_cols.sql is) runs once.
apply() { # stage file tolerated
  local stage=$1 file=$2 tolerated=$3 out rc sha
  sha=$(sha256sum "$file" | cut -d' ' -f1)
  if [ -n "${APPLIED[$sha]:-}" ]; then
    printf '%s\t%s\t%s\tskipped-duplicate\t\n' "$stage" "${file#$LSMB/}" "$tolerated" >>"$LOG"
    return
  fi
  # lsmb_schema: the psql variable LedgerSMB's installer passes (Roles.sql grants on it).
  # Changes run as ONE transaction each, as LedgerSMB's change runner wraps them: several create
  # a TEMPORARY ... ON COMMIT DROP table and read it in a later statement, which autocommit drops
  # immediately (1.6/no-inv-entity-tables.sql — and its missing column cascades into later files).
  local single=()
  [ "$stage" = change ] && single=(--single-transaction)
  # From the LedgerSMB root, as its installer runs: Duplicates_Functions.sql \copy-s the relative
  # path sql/modules/BLACKLIST.
  out=$(cd "$LSMB" && psql -d "$DB" "${single[@]}" -v ON_ERROR_STOP=1 -v lsmb_schema=public -q -X -f "$file" 2>&1 >/dev/null)
  rc=$?
  local first
  first=$(printf '%s' "$out" | grep -m1 -E 'ERROR' | tr '\t' ' ' | cut -c1-200)
  if [ $rc -eq 0 ]; then
    APPLIED[$sha]=1
    printf '%s\t%s\t%s\tok\t\n' "$stage" "${file#$LSMB/}" "$tolerated" >>"$LOG"
  else
    printf '%s\t%s\t%s\tFAILED\t%s\n' "$stage" "${file#$LSMB/}" "$tolerated" "$first" >>"$LOG"
  fi
}

apply base "$LSMB/sql/Pg-database.sql" no

# Seed data, where LedgerSMB's installer loads it: after the base schema, before any change.
seed_out=$(python3 "$HERE/sql/seed_initial_data.py" "$LSMB" | psql -d "$DB" -v ON_ERROR_STOP=1 -q -X 2>&1 >/dev/null)
if [ $? -eq 0 ]; then printf 'seed\tlocale/initial-data.xml\tno\tok\t\n' >>"$LOG"
else printf 'seed\tlocale/initial-data.xml\tno\tFAILED\t%s\n' "$(printf '%s' "$seed_out" | grep -m1 ERROR | cut -c1-200)" >>"$LOG"; fi

while IFS= read -r line; do
  line="${line%%#*}"; line="$(echo "$line" | xargs)"
  [ -z "$line" ] && continue
  tol=no
  if [[ $line == !* ]]; then tol=yes; line="${line#!}"; fi
  apply change "$LSMB/sql/changes/$line" "$tol"
done <"$LSMB/sql/changes/LOADORDER"

while IFS= read -r line; do
  line="${line%%#*}"; line="$(echo "$line" | xargs)"
  [ -z "$line" ] && continue
  apply module "$LSMB/sql/modules/$line" no
done <"$LSMB/sql/modules/LOADORDER"

echo "== summary (stage, tolerated, result: count)"
tail -n +2 "$LOG" | awk -F'\t' '{print $1, "tolerated=" $3, $4}' | sort | uniq -c
echo "== tables: $(psql -d "$DB" -Atc "select count(*) from information_schema.tables where table_schema='public' and table_type='BASE TABLE'")"
echo "== functions: $(psql -d "$DB" -Atc "select count(*) from pg_proc p join pg_namespace n on n.oid=p.pronamespace where n.nspname='public'")"
