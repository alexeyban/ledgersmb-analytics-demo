-- Stocked part × month: quantity received (purchases), sold (sales), adjusted (stock counts), and
-- the running on-hand quantity those movements imply.
with moves as (
    select part_id, invoice_month as month_start, received_quantity as received,
           toDecimal64(0, 4) as sold, toDecimal64(0, 4) as adjusted
    from {{ ref('fct_purchase_lines') }}
    union all
    select part_id, invoice_month, toDecimal64(0, 4), quantity, toDecimal64(0, 4)
    from {{ ref('fct_sales_lines') }} where is_stocked
    union all
    select part_id, toStartOfMonth(count_date), toDecimal64(0, 4), toDecimal64(0, 4), variance_quantity
    from {{ ref('stg_lsmb__inventory_counts') }}
),
monthly as (
    select part_id, month_start, sum(received) as received, sum(sold) as sold, sum(adjusted) as adjusted
    from moves group by part_id, month_start
)
select
    m.month_start as month_start,
    m.part_id as part_id,
    p.part_number,
    p.part_group,
    toDecimal64(m.received, 4)                                         as received_quantity,
    toDecimal64(m.sold, 4)                                             as sold_quantity,
    toDecimal64(m.adjusted, 4)                                         as adjusted_quantity,
    toDecimal64(sum(m.received - m.sold + m.adjusted)
                over (partition by m.part_id order by m.month_start
                      rows between unbounded preceding and current row), 4) as closing_on_hand
from monthly as m
inner join {{ ref('dim_part') }} as p on p.part_id = m.part_id
where p.is_stocked
