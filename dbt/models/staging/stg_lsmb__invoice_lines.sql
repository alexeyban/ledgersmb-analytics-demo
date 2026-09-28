-- One row per invoice line, AR and AP alike. LedgerSMB signs quantity by direction: positive on
-- sales (AR), negative on purchases (AP) — see sql/modules/COGS.sql. `allocated` is LedgerSMB's
-- FIFO allocation state for the line.
select
    id                                   as invoice_line_id,
    trans_id                             as transaction_id,
    parts_id                             as part_id,
    description,
    toDecimal64(qty, 4)                  as quantity_signed,
    toDecimal64(abs(qty), 4)             as quantity,
    toDecimal64(sellprice, 4)            as unit_price,
    toDecimal64(abs(qty) * sellprice, 2) as line_amount,
    toDecimal64(coalesce(discount, 0), 4) as discount,
    toDecimal64(allocated, 4)            as allocated_quantity,
    unit,
    deliverydate                         as delivery_date
from {{ source('lsmb_raw', 'invoice') }}
