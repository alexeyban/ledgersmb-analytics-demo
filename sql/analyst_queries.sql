-- Analyst queries against the LedgerSMB analytics marts (ClickHouse, database lsmb_analytics).
-- Each query is self-contained; run with clickhouse-client or the HTTP interface.

-- 1. Month-over-month revenue growth and gross margin
SELECT
    formatDateTime(month_start, '%Y-%m')                                        AS month,
    revenue,
    -- nullIf: the first month has no predecessor (lag = 0), and Decimal division by zero raises.
    round((revenue / nullIf(lagInFrame(revenue) OVER (ORDER BY month_start), 0) - 1) * 100, 1) AS mom_growth_pct,
    gross_margin_pct
FROM lsmb_analytics.mart_income_statement_monthly
ORDER BY month_start;

-- 2. Same months, year over year (2026 H1 vs 2025 H1)
SELECT toMonth(month_start) AS m,
       sumIf(revenue, toYear(month_start) = 2025) AS rev_2025,
       sumIf(revenue, toYear(month_start) = 2026) AS rev_2026,
       round((rev_2026 / rev_2025 - 1) * 100, 1)  AS yoy_pct
FROM lsmb_analytics.mart_income_statement_monthly
WHERE toMonth(month_start) <= 6
GROUP BY m ORDER BY m;

-- 3. Trial balance at a month end (debit/credit presentation)
SELECT account_number, account_name,
       if(account_category IN ('A', 'E'), closing_balance, 0) AS debit_balance,
       if(account_category IN ('L', 'Q', 'I'), closing_balance, 0) AS credit_balance
FROM lsmb_analytics.mart_trial_balance_monthly
WHERE month_end = toDate('2026-06-30') AND closing_balance != 0
ORDER BY account_number;

-- 4. Customers whose overdue share of receivables exceeds 25%
SELECT customer_name, segment, total_open,
       past_due_31_60 + past_due_61_90 + past_due_over_90 AS over_30,
       round(over_30 / total_open * 100, 1)                AS over_30_pct
FROM lsmb_analytics.mart_ar_aging
WHERE total_open > 0 AND over_30 / total_open > 0.25
ORDER BY over_30 DESC;

-- 5. Margin erosion: part groups whose margin fell between the first and last quarter
WITH q AS (
    SELECT part_group, toStartOfQuarter(month_start) AS qtr,
           sum(gross_margin) / sum(revenue) * 100 AS margin_pct
    FROM lsmb_analytics.mart_sales_by_part_group_monthly
    GROUP BY part_group, qtr
)
SELECT part_group,
       round(argMin(margin_pct, qtr), 1) AS first_q_margin,
       round(argMax(margin_pct, qtr), 1) AS last_q_margin,
       round(last_q_margin - first_q_margin, 1) AS change_pts
FROM q GROUP BY part_group ORDER BY change_pts;

-- 6. Parts at risk of stock-out within 14 days
SELECT part_number, part_group, on_hand_quantity, avg_daily_usage, days_of_supply, reorder_point
FROM lsmb_analytics.mart_inventory_position
WHERE days_of_supply IS NOT NULL AND days_of_supply < 14
ORDER BY days_of_supply;

-- 7. Customer concentration: share of revenue from the top 10 customers
SELECT round(sumIf(revenue, revenue_rank <= 10) / sum(revenue) * 100, 1) AS top10_share_pct
FROM lsmb_analytics.mart_customer_profitability;

-- 8. Cash conversion cycle by month (DSO + DIO − DPO)
SELECT formatDateTime(month_start, '%Y-%m') AS month, dso_days, dio_days, dpo_days,
       round(dso_days + dio_days - dpo_days, 1) AS cash_conversion_cycle_days
FROM lsmb_analytics.mart_working_capital_monthly ORDER BY month_start;

-- 9. Journal drill-down: every line behind an account's balance in a month
SELECT posting_date, transaction_type, transaction_reference, debit_amount, credit_amount
FROM lsmb_analytics.fct_journal_lines
WHERE account_number = '1200' AND posting_month = toDate('2026-06-01')
ORDER BY posting_date, journal_line_id
LIMIT 100;

-- 10. Supplier dependency: parts bought from a single vendor only
SELECT part_number, part_group, any(vendor_name) AS sole_vendor, sum(purchase_amount) AS spend
FROM lsmb_analytics.fct_purchase_lines
GROUP BY part_number, part_group
HAVING uniqExact(vendor_id) = 1
ORDER BY spend DESC;
