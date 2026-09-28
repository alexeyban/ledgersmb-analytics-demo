-- Product-group performance by month: volume, revenue, FIFO COGS, margin.
-- (Aggregated under distinct names first: ClickHouse lets a select alias shadow the source column,
-- so `sum(revenue) as revenue` followed by `sum(revenue)` would nest one aggregate in another.)
with agg as (
    select
        invoice_month                 as month_start,
        part_group,
        count()                       as n_lines,
        uniqExact(transaction_id)     as n_invoices,
        sum(quantity)                 as qty,
        sum(revenue)                  as rev,
        sum(cogs)                     as cost,
        sum(gross_margin)             as margin
    from {{ ref('fct_sales_lines') }}
    group by invoice_month, part_group
)
select
    month_start,
    part_group,
    n_lines                                        as invoice_lines,
    n_invoices                                     as invoices,
    toDecimal64(qty, 4)                            as quantity_sold,
    toDecimal64(rev, 2)                            as revenue,
    toDecimal64(cost, 2)                           as cogs,
    toDecimal64(margin, 2)                         as gross_margin,
    round(if(rev = 0, 0, margin / rev * 100), 2)   as gross_margin_pct
from agg
order by month_start, part_group
