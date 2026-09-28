-- Payment headers (receipts from customers, payments to vendors), as posted by LedgerSMB's
-- payment_post(). payment_class: 1 = vendor payment, 2 = customer receipt.
select
    id                                   as payment_id,
    trans_id                             as transaction_id,
    reference,
    payment_date,
    if(payment_class = 2, 'receipt', 'disbursement') as payment_direction,
    entity_credit_id                     as counterparty_id,
    account_id                           as cash_account_id,
    currency
from {{ source('lsmb_raw', 'payment') }}
