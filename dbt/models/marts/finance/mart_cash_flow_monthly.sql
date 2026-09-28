-- Movements on the bank account (1060) by month, classified by what the other side of each
-- transaction was. Direct-method cash flow.
with cash as (
    select transaction_id, posting_month, sum(natural_amount) as cash_delta
    from {{ ref('fct_journal_lines') }}
    where account_number = '{{ var("acc_cash") }}'
    group by transaction_id, posting_month
),
counter as (
    select transaction_id,
           groupUniqArrayIf(account_number, account_number != '{{ var("acc_cash") }}') as other_accounts,
           any(transaction_type_code) as ttype
    from {{ ref('fct_journal_lines') }}
    group by transaction_id
)
select
    c.posting_month                                                                   as month_start,
    toDecimal64(sumIf(c.cash_delta, has(k.other_accounts, '{{ var("acc_ar") }}')), 2) as receipts_from_customers,
    toDecimal64(sumIf(c.cash_delta, has(k.other_accounts, '{{ var("acc_ap") }}')), 2) as payments_to_suppliers,
    toDecimal64(sumIf(c.cash_delta, has(k.other_accounts, '5410') or has(k.other_accounts, '5440')), 2) as payroll_paid,
    toDecimal64(sumIf(c.cash_delta, has(k.other_accounts, '1820')), 2)               as capital_expenditure,
    toDecimal64(sumIf(c.cash_delta, has(k.other_accounts, '3350')), 2)               as financing,
    toDecimal64(sumIf(c.cash_delta, not (has(k.other_accounts, '{{ var("acc_ar") }}')
                                         or has(k.other_accounts, '{{ var("acc_ap") }}')
                                         or has(k.other_accounts, '5410') or has(k.other_accounts, '5440')
                                         or has(k.other_accounts, '1820') or has(k.other_accounts, '3350'))), 2)
                                                                                      as other_operating,
    toDecimal64(sum(c.cash_delta), 2)                                                 as net_cash_flow
from cash as c
inner join counter as k on k.transaction_id = c.transaction_id
group by c.posting_month
order by month_start
