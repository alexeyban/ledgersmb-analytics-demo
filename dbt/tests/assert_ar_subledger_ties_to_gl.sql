-- The AR subledger (open items) equals the AR control account (1200) at the as-of date.
with sub as (
    select sum(open_balance) as s from {{ ref('int_open_item_balances') }} where ledger = 'AR'
), gl as (
    select closing_balance as g from {{ ref('mart_trial_balance_monthly') }}
    where account_number = '{{ var("acc_ar") }}'
      and month_end = toLastDayOfMonth(toDate('{{ var("as_of_date") }}'))
)
select s, g from sub cross join gl where s != g
