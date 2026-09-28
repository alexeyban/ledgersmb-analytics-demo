-- ClickHouse administrator step for the demo (not an EKOS-generated statement).
--
-- RFC 0160: EKOS never puts a source credential in a statement it generates. Loads read
-- PostgreSQL through a server-side NAMED COLLECTION; the generated SQL only names it:
--     INSERT INTO ... SELECT ... FROM postgresql(lsmb_source, table = 'acc_trans', schema = 'public')
-- The sandbox's built-in collection points at EKOS's fixture database, so the demo creates its own,
-- pointing at the LedgerSMB database. A real deployment would put this in server config.
CREATE NAMED COLLECTION IF NOT EXISTS lsmb_source AS
    host = 'migrate-pg', port = 5432, database = 'ledgersmb', user = 'ekos',
    password = 'ekos-local-only';

-- Raw landing database for EKOS Migrate loads, and the analytics database dbt builds into.
CREATE DATABASE IF NOT EXISTS lsmb_raw;
CREATE DATABASE IF NOT EXISTS lsmb_analytics;
