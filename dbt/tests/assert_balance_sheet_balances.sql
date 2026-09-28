-- Assets = liabilities + equity (incl. earnings to date), every month-end.
select * from {{ ref('mart_balance_sheet_monthly') }}
where total_assets != total_liabilities_and_equity
