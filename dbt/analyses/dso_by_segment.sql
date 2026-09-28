-- Analysis: average days-to-pay and open receivables by customer segment.
select segment,
       count()                                  as customers,
       round(avg(avg_days_to_pay), 1)           as avg_days_to_pay,
       sum(open_receivables)                    as open_receivables,
       round(sum(gross_margin) / sum(revenue) * 100, 1) as margin_pct
from {{ ref('mart_customer_profitability') }}
group by segment
order by avg_days_to_pay desc
