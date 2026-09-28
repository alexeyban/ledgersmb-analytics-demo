#!/usr/bin/env bash
# Dump the ClickHouse DDL actually deployed — raw tables (created by EKOS Migrate) and every dbt
# model — to clickhouse/ddl/. Run after a pipeline run; the files are the target database's code.
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
CH="http://127.0.0.1:58123/?user=ekos&password=${LSMB_CH_PASSWORD:-ekos-local-only}"
for db in lsmb_raw lsmb_analytics; do
  out="$HERE/ddl/${db}_deployed.sql"
  echo "-- ClickHouse DDL deployed in database ${db}, dumped $(date -u +%FT%TZ) by clickhouse/dump_ddl.sh" >"$out"
  for t in $(curl -s "$CH" --data-binary "SELECT name FROM system.tables WHERE database = '${db}' ORDER BY name"); do
    echo "" >>"$out"
    curl -s "$CH" --data-binary "SHOW CREATE TABLE ${db}.\`${t}\` FORMAT TSVRaw" >>"$out"
    echo ";" >>"$out"
  done
  echo "$out: $(grep -c '^CREATE' "$out") objects"
done
