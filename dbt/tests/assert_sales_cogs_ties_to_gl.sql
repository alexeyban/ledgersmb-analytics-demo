-- FIFO COGS on sales lines equals the COGS account (5010) postings on sales transactions.
with f as (select sum(cogs) as c from {{ ref('fct_sales_lines') }}),
     g as (select sum(natural_amount) as c from {{ ref('fct_journal_lines') }}
           where account_number = '{{ var("acc_cogs") }}' and transaction_type_code = 'ar')
select f.c as fact_cogs, g.c as gl_cogs from f cross join g where f.c != g.c
