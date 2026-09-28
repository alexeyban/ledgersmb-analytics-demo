-- One row per LedgerSMB transaction header (the common parent of AR, AP, GL, payment and
-- inventory-adjustment entries).
select
    t.id                          as transaction_id,
    t.transdate                   as transaction_date,
    t.trans_type_code             as transaction_type_code,
    tt.description                as transaction_type,
    t.reference as reference,
    t.description as description,
    t.approved                    as is_approved,
    t.reversing                   as reverses_transaction_id
from {{ source('lsmb_raw', 'transactions') }} as t
left join {{ source('lsmb_raw', 'trans_type') }} as tt on tt.code = t.trans_type_code
