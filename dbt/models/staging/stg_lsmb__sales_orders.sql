-- Sales orders (oe_class 1). `closed` = fully shipped/invoiced.
select
    o.id                                 as order_id,
    o.ordnumber                          as order_number,
    o.transdate                          as order_date,
    o.reqdate                            as required_date,
    o.entity_credit_account              as counterparty_id,
    o.closed                             as is_closed,
    toDecimal64(o.netamount_tc, 2)       as net_amount,
    oc.oe_class                          as order_class
from {{ source('lsmb_raw', 'oe') }} as o
inner join {{ source('lsmb_raw', 'oe_class') }} as oc on oc.id = o.oe_class_id
where o.oe_class_id = 1
