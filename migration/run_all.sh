#!/usr/bin/env bash
# The whole EKOS Migrate run, end to end, under project $PROJECT (default ledgersmb-analytics-final).
#
# History: attempt 1 (logs/migration_attempt1.log) exposed EKOS defects, including a self-approval
# hole in RFC 0161; an approval recorded under that bug is still in the append-only ledger, so every
# rerun uses a fresh project rather than building on it. All the defects are fixed in EKOS
# (devlog_226); this script runs against the fixed binary.
set -uo pipefail
export LC_ALL=C
HERE="$(cd "$(dirname "$0")/.." && pwd)"
M="$HERE/migration/ekos_migrate.sh"
PROJECT="${PROJECT:-ledgersmb-analytics-final}"
export PGPASSWORD=ekos-local-only
CH="http://127.0.0.1:58123/?user=ekos&password=ekos-local-only"

sed -i "s/^project = \".*\"/project = \"$PROJECT\"/" "$HERE/ekos/ledgersmb-demo.toml"

"$M" init --name "$PROJECT" --source postgres://lsmb-pg/ledgersmb \
  --target clickhouse://lsmb-ch/lsmb_raw \
  --source-secret-env LSMB_PG_PASSWORD --target-secret-env LSMB_CH_PASSWORD | tail -2
"$M" discover | tail -10
# P1 estimates come from planner statistics; a freshly loaded database has none until ANALYZE.
psql -h 127.0.0.1 -p 55432 -U ekos -d ledgersmb -qc "ANALYZE"
"$M" profile --tier p1 | tail -2
"$M" assess | grep -E "finding\(s\)|blocking|Coverage" | head -5
"$M" map --emit "$HERE/clickhouse/ddl/ekos_generated_raw.sql" | tail -1

# Clean target, so every table is created by this run's approved DDL.
for t in $(curl -s "$CH" --data-binary "SELECT name FROM system.tables WHERE database = 'lsmb_raw'"); do
  curl -s "$CH" --data-binary "DROP TABLE lsmb_raw.\`$t\`"
done

"$HERE/migration/migrate_units.sh"
"$M" report --out "$HERE/docs/migration_report.md" | tail -3
