-- The value of count variances equals the inventory-adjustment ('ia') postings to Inventory (1510).
with v as (select sum(variance_value) as x from {{ ref('mart_stock_count_variance') }}),
     g as (select sum(debit_amount - credit_amount) as x from {{ ref('fct_journal_lines') }}
           where transaction_type_code = 'ia' and account_number = '{{ var("acc_inventory") }}')
select v.x as variance_value, g.x as gl_adjustment from v cross join g where v.x != g.x
