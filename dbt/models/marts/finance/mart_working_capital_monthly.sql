-- Month-end working-capital metrics: DSO, DPO and DIO on a 30-day month, from month-end balances
-- (trial balance) and the month's revenue and COGS (income statement).
with bal as (
    select month_start,
           sumIf(closing_balance, account_number = '{{ var("acc_ar") }}')        as ar,
           sumIf(closing_balance, account_number = '{{ var("acc_ap") }}')        as ap,
           sumIf(closing_balance, account_number = '{{ var("acc_inventory") }}') as inventory
    from {{ ref('mart_trial_balance_monthly') }}
    group by month_start
)
select
    b.month_start as month_start,
    toDecimal64(b.ar, 2)         as accounts_receivable,
    toDecimal64(b.ap, 2)         as accounts_payable,
    toDecimal64(b.inventory, 2)  as inventory,
    round(if(p.revenue = 0, null, b.ar / p.revenue * 30), 1)             as dso_days,
    round(if(p.cost_of_goods_sold = 0, null, b.ap / p.cost_of_goods_sold * 30), 1) as dpo_days,
    round(if(p.cost_of_goods_sold = 0, null, b.inventory / p.cost_of_goods_sold * 30), 1) as dio_days
from bal as b
inner join {{ ref('mart_income_statement_monthly') }} as p on p.month_start = b.month_start
order by month_start
