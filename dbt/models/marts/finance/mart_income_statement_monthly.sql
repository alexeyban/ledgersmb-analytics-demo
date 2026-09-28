-- Profit & loss by month, one row per month. Revenue and COGS are the GL (4010 / 5010); operating
-- expenses by heading. Gross-margin and net-income percentages are of revenue.
with pl as (
    select
        posting_month as month_start,
        sumIf(natural_amount, account_category = 'I')                                   as revenue,
        sumIf(natural_amount, account_number = '{{ var("acc_cogs") }}')                  as cogs,
        sumIf(natural_amount, account_category = 'E' and heading_name = 'PAYROLL EXPENSES') as payroll,
        sumIf(natural_amount, account_category = 'E'
                               and heading_name = 'GENERAL & ADMINISTRATIVE EXPENSES')  as general_admin,
        sumIf(natural_amount, account_category = 'E'
                               and account_number != '{{ var("acc_cogs") }}'
                               and heading_name not in ('PAYROLL EXPENSES',
                                                        'GENERAL & ADMINISTRATIVE EXPENSES')) as other_expense
    from {{ ref('fct_journal_lines') }}
    where account_category in ('I', 'E')
    group by posting_month
)
select
    month_start,
    toDecimal64(revenue, 2)                                            as revenue,
    toDecimal64(cogs, 2)                                               as cost_of_goods_sold,
    toDecimal64(revenue - cogs, 2)                                     as gross_profit,
    round(if(revenue = 0, 0, (revenue - cogs) / revenue) * 100, 2)     as gross_margin_pct,
    toDecimal64(payroll, 2)                                            as payroll_expense,
    toDecimal64(general_admin, 2)                                      as general_admin_expense,
    toDecimal64(other_expense, 2)                                      as other_expense,
    toDecimal64(revenue - cogs - payroll - general_admin - other_expense, 2) as net_income,
    round(if(revenue = 0, 0, (revenue - cogs - payroll - general_admin - other_expense) / revenue) * 100, 2)
                                                                       as net_margin_pct
from pl
order by month_start
