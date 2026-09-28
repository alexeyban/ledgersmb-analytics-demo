-- Purchase-invoice lines (vendor invoices). Quantity is stored negative on AP lines; `quantity`
-- here is the received amount.
select
    l.invoice_line_id as invoice_line_id,
    l.transaction_id as transaction_id,
    i.invoice_number as invoice_number,
    i.invoice_date as invoice_date,
    toStartOfMonth(i.invoice_date)  as invoice_month,
    i.counterparty_id               as vendor_id,
    l.part_id as part_id,
    l.quantity                      as received_quantity,
    l.unit_price                    as unit_cost,
    l.line_amount                   as purchase_amount
from {{ ref('stg_lsmb__invoice_lines') }} as l
inner join {{ ref('stg_lsmb__ap_invoices') }} as i on i.transaction_id = l.transaction_id
