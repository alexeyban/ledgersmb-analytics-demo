-- Account × month: opening balance, period debits and credits, closing balance — all in the
-- account's natural sign. Every account appears in every month (zero rows included), so a month's
-- trial balance is complete even for accounts with no activity.
with months as (
    select distinct month_start from {{ ref('dim_date') }}
),
activity as (
    select account_id, posting_month as month_start,
           sum(debit_amount) as debits, sum(credit_amount) as credits,
           sum(natural_amount) as net_natural
    from {{ ref('fct_journal_lines') }}
    group by account_id, posting_month
),
grid as (
    select a.account_id, a.account_number, a.account_name, a.account_category,
           a.account_category_name, a.heading_name, m.month_start
    from {{ ref('dim_account') }} as a
    cross join months as m
)
select
    g.month_start as month_start,
    toLastDayOfMonth(g.month_start)                                        as month_end,
    g.account_id, g.account_number, g.account_name, g.account_category,
    g.account_category_name, g.heading_name,
    toDecimal64(sum(coalesce(ac.net_natural, 0)) over w - coalesce(ac.net_natural, 0), 2) as opening_balance,
    toDecimal64(coalesce(ac.debits, 0), 2)                                 as period_debits,
    toDecimal64(coalesce(ac.credits, 0), 2)                                as period_credits,
    toDecimal64(sum(coalesce(ac.net_natural, 0)) over w, 2)                as closing_balance
from grid as g
left join activity as ac on ac.account_id = g.account_id and ac.month_start = g.month_start
window w as (partition by g.account_id order by g.month_start
             rows between unbounded preceding and current row)
