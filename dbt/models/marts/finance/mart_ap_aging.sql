-- Payables aging as of `as_of_date`, per vendor.
select
    o.as_of_date as as_of_date,
    o.counterparty_id                                                  as vendor_id,
    c.counterparty_name                                                as vendor_name,
    count()                                                            as open_invoices,
    toDecimal64(sum(o.open_balance), 2)                                as total_open,
    toDecimal64(sumIf(o.open_balance, o.days_past_due <= 0), 2)        as not_yet_due,
    toDecimal64(sumIf(o.open_balance, o.days_past_due between 1 and 30), 2)  as past_due_1_30,
    toDecimal64(sumIf(o.open_balance, o.days_past_due > 30), 2)       as past_due_over_30
from {{ ref('int_open_item_balances') }} as o
left join {{ ref('dim_counterparty') }} as c on c.counterparty_id = o.counterparty_id
where o.ledger = 'AP' and o.open_balance != 0
group by o.as_of_date, o.counterparty_id, c.counterparty_name
