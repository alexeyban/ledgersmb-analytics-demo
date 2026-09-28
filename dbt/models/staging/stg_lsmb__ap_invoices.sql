-- Vendor (AP) documents: one row per invoice.
select
    ap.trans_id                            as transaction_id,
    ap.invnumber                           as invoice_number,
    t.transdate                            as invoice_date,
    ap.duedate                             as due_date,
    ap.entity_credit_account               as counterparty_id,
    ap.open_item_id as open_item_id,
    ap.invoice                             as is_item_invoice,
    ap.curr                                as currency,
    toDecimal64(ap.netamount_bc, 2)        as net_amount,
    toDecimal64(ap.amount_bc, 2)           as gross_amount,
    ap.is_return as is_return
from {{ source('lsmb_raw', 'ap') }} as ap
inner join {{ source('lsmb_raw', 'transactions') }} as t on t.id = ap.trans_id
