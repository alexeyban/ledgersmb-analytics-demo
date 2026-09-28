-- Each month's trial balance: total period debits equal total period credits.
select month_start, sum(period_debits) as debits, sum(period_credits) as credits
from {{ ref('mart_trial_balance_monthly') }}
group by month_start
having sum(period_debits) != sum(period_credits)
