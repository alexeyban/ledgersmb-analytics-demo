-- Current stock position per stocked part as of `as_of_date`: quantity, value at last cost, average
-- daily usage over the last 90 days, days of supply, and whether it sits below its reorder point.
with usage as (
    select part_id, sum(quantity) / 90 as avg_daily_usage
    from {{ ref('fct_sales_lines') }}
    where invoice_date > toDate('{{ var("as_of_date") }}') - 90 and is_stocked
    group by part_id
)
select
    p.part_id as part_id,
    p.part_number as part_number,
    p.part_name as part_name,
    p.part_group as part_group,
    p.on_hand_quantity as on_hand_quantity,
    p.last_cost as last_cost,
    toDecimal64(p.on_hand_quantity * p.last_cost, 2)                     as inventory_value,
    round(coalesce(u.avg_daily_usage, 0), 3)                              as avg_daily_usage,
    if(coalesce(u.avg_daily_usage, 0) = 0, null,
       round(p.on_hand_quantity / u.avg_daily_usage, 1))                  as days_of_supply,
    p.reorder_point as reorder_point,
    p.on_hand_quantity < p.reorder_point                                  as below_reorder_point
from {{ ref('dim_part') }} as p
left join usage as u on u.part_id = p.part_id
where p.is_stocked
