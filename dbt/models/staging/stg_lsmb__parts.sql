-- Goods and services. A part with an inventory account is a stocked good; without one, a service.
select
    p.id                                  as part_id,
    p.partnumber                          as part_number,
    p.description                         as part_name,
    pg.partsgroup                         as part_group,
    p.unit as unit,
    toDecimal64(p.listprice, 2)           as list_price,
    toDecimal64(p.sellprice, 2)           as sell_price,
    toDecimal64(p.lastcost, 2)            as last_cost,
    toDecimal64(p.onhand, 4)              as on_hand_quantity,
    toDecimal64(coalesce(p.rop, 0), 4)    as reorder_point,
    p.inventory_accno_id is not null      as is_stocked,
    p.inventory_accno_id                  as inventory_account_id,
    p.income_accno_id                     as income_account_id,
    p.expense_accno_id                    as expense_account_id,
    p.obsolete                            as is_obsolete
from {{ source('lsmb_raw', 'parts') }} as p
left join {{ source('lsmb_raw', 'partsgroup') }} as pg on pg.id = p.partsgroup_id
