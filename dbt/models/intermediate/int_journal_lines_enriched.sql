-- Journal lines with their account and transaction context, plus the line's effect on the
-- account's NATURAL balance: debit-normal accounts (A, E) grow with debits, the rest with credits.
select
    j.journal_line_id as journal_line_id,
    j.transaction_id as transaction_id,
    j.posting_date as posting_date,
    toStartOfMonth(j.posting_date)                               as posting_month,
    j.account_id as account_id,
    a.account_number as account_number,
    a.account_name as account_name,
    a.account_category as account_category,
    a.account_category_name as account_category_name,
    a.heading_number as heading_number,
    a.heading_name as heading_name,
    a.is_contra as is_contra,
    t.transaction_type_code as transaction_type_code,
    t.transaction_type as transaction_type,
    t.reference                                                  as transaction_reference,
    j.debit_amount as debit_amount,
    j.credit_amount as credit_amount,
    j.amount_signed as amount_signed,
    toDecimal64(if(a.is_debit_normal, j.debit_amount - j.credit_amount,
                                      j.credit_amount - j.debit_amount), 2) as natural_amount,
    j.invoice_line_id as invoice_line_id,
    j.open_item_id as open_item_id,
    j.is_approved as is_approved
from {{ ref('stg_lsmb__journal_lines') }} as j
inner join {{ ref('stg_lsmb__accounts') }} as a on a.account_id = j.account_id
inner join {{ ref('stg_lsmb__transactions') }} as t on t.transaction_id = j.transaction_id
