-- ABC classification of parts by revenue over the last 12 months: A = the parts making up the
-- first 80% of revenue, B = the next 15%, C = the rest.
with rev as (
    select part_id, any(part_number) as part_number, any(part_group) as part_group,
           sum(revenue) as revenue, sum(gross_margin) as gross_margin
    from {{ ref('fct_sales_lines') }}
    where invoice_date > toDate('{{ var("as_of_date") }}') - 365
    group by part_id
),
ranked as (
    select *,
           sum(revenue) over (order by revenue desc, part_id rows between unbounded preceding and current row)
             / sum(revenue) over () as cumulative_share
    from rev
)
select
    part_id, part_number, part_group,
    toDecimal64(revenue, 2)                           as revenue_12m,
    toDecimal64(gross_margin, 2)                      as gross_margin_12m,
    round(cumulative_share * 100, 2)                  as cumulative_revenue_pct,
    multiIf(cumulative_share <= 0.80, 'A', cumulative_share <= 0.95, 'B', 'C') as abc_class
from ranked
