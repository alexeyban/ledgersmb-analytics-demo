-- Receivables aging as of `as_of_date`, per customer, in the standard buckets.
select
    o.as_of_date as as_of_date,
    o.counterparty_id                                                  as customer_id,
    c.counterparty_name                                                as customer_name,
    c.segment as segment,
    count()                                                            as open_invoices,
    toDecimal64(sum(o.open_balance), 2)                                as total_open,
    toDecimal64(sumIf(o.open_balance, o.days_past_due <= 0), 2)        as not_yet_due,
    toDecimal64(sumIf(o.open_balance, o.days_past_due between 1 and 30), 2)  as past_due_1_30,
    toDecimal64(sumIf(o.open_balance, o.days_past_due between 31 and 60), 2) as past_due_31_60,
    toDecimal64(sumIf(o.open_balance, o.days_past_due between 61 and 90), 2) as past_due_61_90,
    toDecimal64(sumIf(o.open_balance, o.days_past_due > 90), 2)       as past_due_over_90,
    max(o.days_past_due)                                               as oldest_days_past_due
from {{ ref('int_open_item_balances') }} as o
left join {{ ref('dim_counterparty') }} as c on c.counterparty_id = o.counterparty_id
where o.ledger = 'AR' and o.open_balance != 0
group by o.as_of_date, o.counterparty_id, c.counterparty_name, c.segment
