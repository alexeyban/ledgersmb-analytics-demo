-- Grain: one sales-invoice line, with revenue, FIFO COGS (posted by LedgerSMB) and gross margin.
select
    s.invoice_line_id as invoice_line_id,
    s.transaction_id as transaction_id,
    s.invoice_number as invoice_number,
    s.invoice_date as invoice_date,
    s.invoice_month as invoice_month,
    s.customer_id as customer_id,
    c.counterparty_name    as customer_name,
    c.segment              as customer_segment,
    s.part_id as part_id,
    p.part_number,
    p.part_group,
    p.is_stocked,
    s.quantity as quantity,
    s.unit_price as unit_price,
    s.revenue as revenue,
    s.cogs as cogs,
    s.gross_margin as gross_margin,
    s.has_cogs as has_cogs
from {{ ref('int_sales_lines') }} as s
left join {{ ref('dim_part') }} as p on p.part_id = s.part_id
left join {{ ref('dim_counterparty') }} as c on c.counterparty_id = s.customer_id
