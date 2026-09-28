-- Receipts − sales + count adjustments, accumulated, reproduce each part's on-hand quantity.
with last as (
    select part_id, argMax(closing_on_hand, month_start) as rebuilt
    from {{ ref('mart_inventory_movements_monthly') }} group by part_id
)
select p.part_id, p.on_hand_quantity, l.rebuilt
from {{ ref('dim_part') }} as p
inner join last as l on l.part_id = p.part_id
where p.is_stocked and p.on_hand_quantity != l.rebuilt
