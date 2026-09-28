-- Customer (AR) documents: one row per invoice. Dates live on the transaction header.
select
    ar.trans_id                            as transaction_id,
    ar.invnumber                           as invoice_number,
    t.transdate                            as invoice_date,
    ar.duedate                             as due_date,
    ar.entity_credit_account               as counterparty_id,
    ar.open_item_id as open_item_id,
    ar.invoice                             as is_item_invoice,
    ar.curr                                as currency,
    toDecimal64(ar.netamount_bc, 2)        as net_amount,
    toDecimal64(ar.amount_bc, 2)           as gross_amount,
    toDecimal64(ar.amount_bc - ar.netamount_bc, 2) as tax_amount,
    ar.is_return as is_return
from {{ source('lsmb_raw', 'ar') }} as ar
inner join {{ source('lsmb_raw', 'transactions') }} as t on t.id = ar.trans_id
