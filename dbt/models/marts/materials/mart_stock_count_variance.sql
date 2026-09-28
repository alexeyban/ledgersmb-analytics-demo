-- Physical-count variance (shrinkage) per count and part group, in quantity and at last cost.
select
    c.count_date as count_date,
    p.part_group as part_group,
    count()                                                        as parts_counted,
    countIf(c.variance_quantity != 0)                              as parts_with_variance,
    toDecimal64(sum(c.expected_quantity), 4)                       as expected_quantity,
    toDecimal64(sum(c.counted_quantity), 4)                        as counted_quantity,
    toDecimal64(sum(c.variance_quantity), 4)                       as variance_quantity,
    toDecimal64(sum(c.variance_quantity * p.last_cost), 2)         as variance_value
from {{ ref('stg_lsmb__inventory_counts') }} as c
inner join {{ ref('dim_part') }} as p on p.part_id = c.part_id
group by c.count_date, p.part_group
order by count_date, part_group
