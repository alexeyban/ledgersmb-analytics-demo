-- Analysis (compiled, not materialized): revenue bridge between two quarters by part group —
-- how much of the change came from volume and how much from price/mix.
with q as (
    select part_group, toStartOfQuarter(invoice_month) as qtr,
           sum(quantity) as qty, sum(revenue) as rev
    from {{ ref('fct_sales_lines') }}
    group by part_group, qtr
),
pair as (
    select part_group,
           argMinIf(qty, qtr, qtr = toDate('2025-04-01')) as q0_qty,
           argMinIf(rev, qtr, qtr = toDate('2025-04-01')) as q0_rev,
           argMinIf(qty, qtr, qtr = toDate('2026-04-01')) as q1_qty,
           argMinIf(rev, qtr, qtr = toDate('2026-04-01')) as q1_rev
    from q group by part_group
)
select part_group, q0_rev, q1_rev,
       (q1_qty - q0_qty) * (q0_rev / nullIf(q0_qty, 0))           as volume_effect,
       q1_rev - q0_rev - (q1_qty - q0_qty) * (q0_rev / nullIf(q0_qty, 0)) as price_mix_effect
from pair
order by q1_rev - q0_rev desc
