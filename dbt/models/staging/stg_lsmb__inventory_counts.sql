-- Physical stock counts: one row per counted part per count. variance = counted - expected.
select
    r.id                                 as count_id,
    r.report_date                        as count_date,
    r.trans_id                           as adjustment_transaction_id,
    l.parts_id                           as part_id,
    toDecimal64(l.expected, 4)           as expected_quantity,
    toDecimal64(l.counted, 4)            as counted_quantity,
    toDecimal64(l.variance, 4)           as variance_quantity
from {{ source('lsmb_raw', 'inventory_report') }} as r
inner join {{ source('lsmb_raw', 'inventory_report_line') }} as l on l.adjust_id = r.id
