-- The AP subledger (open items) equals the AP control account (2100) at the as-of date.
with sub as (
    select sum(open_balance) as s from {{ ref('int_open_item_balances') }} where ledger = 'AP'
), gl as (
    select closing_balance as g from {{ ref('mart_trial_balance_monthly') }}
    where account_number = '{{ var("acc_ap") }}'
      and month_end = toLastDayOfMonth(toDate('{{ var("as_of_date") }}'))
)
select s, g from sub cross join gl where s != g
