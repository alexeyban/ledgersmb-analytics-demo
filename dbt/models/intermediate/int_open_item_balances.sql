-- The outstanding balance of every AR and AP open item as of `as_of_date`, from the journal lines
-- on the open-item-managed control accounts (1200 AR, 2100 AP). Positive = owed (to us for AR,
-- by us for AP).
with lines as (
    select
        j.open_item_id as open_item_id,
        j.account_number as account_number,
        sumIf(if(j.account_number = '{{ var("acc_ar") }}', j.debit_amount - j.credit_amount,
                                                           j.credit_amount - j.debit_amount),
              j.posting_date <= toDate('{{ var("as_of_date") }}'))     as balance,
        minIf(j.posting_date, j.posting_date <= toDate('{{ var("as_of_date") }}')) as first_posting
    from {{ ref('int_journal_lines_enriched') }} as j
    where j.account_number in ('{{ var("acc_ar") }}', '{{ var("acc_ap") }}')
      and j.open_item_id is not null
    group by j.open_item_id, j.account_number
),
docs as (
    select open_item_id, 'AR' as ledger, transaction_id, invoice_number, invoice_date, due_date,
           counterparty_id, gross_amount
    from {{ ref('stg_lsmb__ar_invoices') }}
    union all
    select open_item_id, 'AP', transaction_id, invoice_number, invoice_date, due_date,
           counterparty_id, gross_amount
    from {{ ref('stg_lsmb__ap_invoices') }}
)
select
    d.open_item_id as open_item_id,
    d.ledger as ledger,
    d.transaction_id as transaction_id,
    d.invoice_number as invoice_number,
    d.invoice_date as invoice_date,
    d.due_date as due_date,
    d.counterparty_id as counterparty_id,
    d.gross_amount as gross_amount,
    toDecimal64(l.balance, 2)                                          as open_balance,
    toDate('{{ var("as_of_date") }}')                                  as as_of_date,
    dateDiff('day', d.due_date, toDate('{{ var("as_of_date") }}'))     as days_past_due
from docs as d
inner join lines as l on l.open_item_id = d.open_item_id
where d.invoice_date <= toDate('{{ var("as_of_date") }}')
