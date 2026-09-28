-- Stock at last cost equals the Inventory account (1510) at the as-of date. Exact here because a
-- part's purchase cost is constant in this dataset; with changing costs, FIFO layers would differ
-- from last cost and this test would be a tolerance check instead.
with p as (select sum(inventory_value) as x from {{ ref('mart_inventory_position') }}),
     g as (select closing_balance as x from {{ ref('mart_trial_balance_monthly') }}
           where account_number = '{{ var("acc_inventory") }}'
             and month_end = toLastDayOfMonth(toDate('{{ var("as_of_date") }}')))
select p.x as position_value, g.x as gl_inventory from p cross join g where p.x != g.x
