-- Per customer over the whole period: revenue, margin, order frequency, payment behaviour
-- (average days from invoice to settlement, from LedgerSMB's payments) and current open AR.
with sales as (
    select customer_id, any(customer_name) as customer_name, any(customer_segment) as segment,
           uniqExact(transaction_id) as invoices, sum(revenue) as revenue,
           sum(gross_margin) as gross_margin, min(invoice_date) as first_invoice,
           max(invoice_date) as last_invoice
    from {{ ref('fct_sales_lines') }}
    group by customer_id
),
settled as (
    -- invoice date → date its open item reached zero (the last posting on the AR line)
    select i.counterparty_id as customer_id,
           avg(dateDiff('day', i.invoice_date, s.settled_on)) as avg_days_to_pay
    from {{ ref('stg_lsmb__ar_invoices') }} as i
    inner join (
        select open_item_id, max(posting_date) as settled_on
        from {{ ref('fct_journal_lines') }}
        where account_number = '{{ var("acc_ar") }}'
        group by open_item_id
        having sum(debit_amount) = sum(credit_amount)
    ) as s on s.open_item_id = i.open_item_id
    group by i.counterparty_id
),
open_ar as (
    select customer_id, sum(total_open) as open_ar from {{ ref('mart_ar_aging') }} group by customer_id
)
select
    s.customer_id as customer_id,
    s.customer_name as customer_name,
    s.segment as segment,
    s.invoices as invoices,
    toDecimal64(s.revenue, 2)                                         as revenue,
    toDecimal64(s.gross_margin, 2)                                    as gross_margin,
    round(if(s.revenue = 0, 0, s.gross_margin / s.revenue * 100), 2)  as gross_margin_pct,
    round(p.avg_days_to_pay, 1)                                       as avg_days_to_pay,
    toDecimal64(coalesce(o.open_ar, 0), 2)                            as open_receivables,
    s.first_invoice as first_invoice,
    s.last_invoice as last_invoice,
    rank() over (order by s.revenue desc)                             as revenue_rank
from sales as s
left join settled as p on p.customer_id = s.customer_id
left join open_ar as o on o.customer_id = s.customer_id
