-- Sales-invoice lines with revenue and the EXACT cost of goods sold LedgerSMB's FIFO procedure
-- (cogs__add_for_ar_line) posted for that line: the COGS journal lines carry the invoice line id.
with cogs as (
    select invoice_line_id, sum(debit_amount - credit_amount) as cogs_amount
    from {{ ref('int_journal_lines_enriched') }}
    where account_number = '{{ var("acc_cogs") }}'
      and transaction_type_code = 'ar'
      and invoice_line_id is not null
    group by invoice_line_id
)
select
    l.invoice_line_id as invoice_line_id,
    l.transaction_id as transaction_id,
    i.invoice_number as invoice_number,
    i.invoice_date as invoice_date,
    toStartOfMonth(i.invoice_date)                         as invoice_month,
    i.counterparty_id                                      as customer_id,
    l.part_id as part_id,
    l.quantity as quantity,
    l.unit_price as unit_price,
    l.line_amount                                          as revenue,
    toDecimal64(coalesce(c.cogs_amount, 0), 2)             as cogs,
    toDecimal64(l.line_amount - coalesce(c.cogs_amount, 0), 2) as gross_margin,
    c.cogs_amount is not null                              as has_cogs
from {{ ref('stg_lsmb__invoice_lines') }} as l
inner join {{ ref('stg_lsmb__ar_invoices') }} as i on i.transaction_id = l.transaction_id
left join cogs as c on c.invoice_line_id = l.invoice_line_id
