-- Grain: one purchase-invoice line (goods received from a vendor).
select
    l.invoice_line_id as invoice_line_id,
    l.transaction_id as transaction_id,
    l.invoice_number as invoice_number,
    l.invoice_date as invoice_date,
    l.invoice_month as invoice_month,
    l.vendor_id as vendor_id,
    c.counterparty_name as vendor_name,
    l.part_id as part_id,
    p.part_number,
    p.part_group,
    l.received_quantity as received_quantity,
    l.unit_cost as unit_cost,
    l.purchase_amount as purchase_amount
from {{ ref('int_purchase_lines') }} as l
left join {{ ref('dim_part') }} as p on p.part_id = l.part_id
left join {{ ref('dim_counterparty') }} as c on c.counterparty_id = l.vendor_id
