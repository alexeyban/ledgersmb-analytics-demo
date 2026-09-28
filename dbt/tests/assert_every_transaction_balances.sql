-- Double entry: every transaction's debits equal its credits. Returns unbalanced transactions.
select transaction_id, sum(debit_amount) as debits, sum(credit_amount) as credits
from {{ ref('fct_journal_lines') }}
group by transaction_id
having sum(debit_amount) != sum(credit_amount)
