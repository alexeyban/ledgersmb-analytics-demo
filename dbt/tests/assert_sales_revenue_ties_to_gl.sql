-- Line-level revenue in the sales fact equals the Sales account (4010) in the GL.
with f as (select sum(revenue) as r from {{ ref('fct_sales_lines') }}),
     g as (select sum(natural_amount) as r from {{ ref('fct_journal_lines') }}
           where account_number = '{{ var("acc_sales") }}')
select f.r as fact_revenue, g.r as gl_revenue from f cross join g where f.r != g.r
