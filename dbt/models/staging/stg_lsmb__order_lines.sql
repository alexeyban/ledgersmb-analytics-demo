select
    id                                   as order_line_id,
    trans_id                             as order_id,
    parts_id                             as part_id,
    toDecimal64(qty, 4)                  as ordered_quantity,
    toDecimal64(coalesce(ship, 0), 4)    as shipped_quantity,
    toDecimal64(sellprice, 4)            as unit_price,
    toDecimal64(qty * sellprice, 2)      as line_amount,
    reqdate                              as required_date
from {{ source('lsmb_raw', 'orderitems') }}
