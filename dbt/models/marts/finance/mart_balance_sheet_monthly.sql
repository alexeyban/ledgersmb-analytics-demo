-- Month-end balance sheet. There are no year-end closing entries in the ledger, so current-period
-- earnings (cumulative income − expense) are shown as their own equity line; with it, assets equal
-- liabilities plus equity every month (asserted by tests/assert_balance_sheet_balances.sql).
with tb as (
    select month_end, account_category, sum(closing_balance) as bal
    from {{ ref('mart_trial_balance_monthly') }}
    group by month_end, account_category
)
select
    month_end,
    toDecimal64(sumIf(bal, account_category = 'A'), 2)                          as total_assets,
    toDecimal64(sumIf(bal, account_category = 'L'), 2)                          as total_liabilities,
    toDecimal64(sumIf(bal, account_category = 'Q'), 2)                          as contributed_equity,
    toDecimal64(sumIf(bal, account_category = 'I') - sumIf(bal, account_category = 'E'), 2)
                                                                                as retained_earnings_to_date,
    toDecimal64(sumIf(bal, account_category = 'L') + sumIf(bal, account_category = 'Q')
                + sumIf(bal, account_category = 'I') - sumIf(bal, account_category = 'E'), 2)
                                                                                as total_liabilities_and_equity
from tb
group by month_end
order by month_end
