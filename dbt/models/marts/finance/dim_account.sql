-- The chart of accounts (LedgerSMB US General chart), with heading and link roles.
select * from {{ ref('stg_lsmb__accounts') }}
