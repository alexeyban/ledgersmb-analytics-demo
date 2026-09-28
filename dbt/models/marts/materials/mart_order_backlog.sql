-- Open (not closed) sales orders as of `as_of_date`: value, lines and age.
select
    o.order_id as order_id,
    o.order_number as order_number,
    o.order_date as order_date,
    o.required_date as required_date,
    o.counterparty_id                                                   as customer_id,
    c.counterparty_name                                                 as customer_name,
    o.net_amount as net_amount,
    count(l.order_line_id)                                              as order_lines,
    dateDiff('day', o.order_date, toDate('{{ var("as_of_date") }}'))    as age_days,
    o.required_date < toDate('{{ var("as_of_date") }}')                 as is_late
from {{ ref('stg_lsmb__sales_orders') }} as o
left join {{ ref('stg_lsmb__order_lines') }} as l on l.order_id = o.order_id
left join {{ ref('dim_counterparty') }} as c on c.counterparty_id = o.counterparty_id
where not o.is_closed and o.order_date <= toDate('{{ var("as_of_date") }}')
group by o.order_id, o.order_number, o.order_date, o.required_date, o.counterparty_id,
         c.counterparty_name, o.net_amount
