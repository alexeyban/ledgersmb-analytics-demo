-- One row per journal line (LedgerSMB acc_trans). LedgerSMB stores ONE signed amount per line:
-- negative = debit, positive = credit (verified in sql/modules/trial_balance.sql). This model
-- splits it into debit/credit columns so nothing downstream re-derives the convention.
select
    entry_id                                           as journal_line_id,
    trans_id                                           as transaction_id,
    chart_id                                           as account_id,
    transdate                                          as posting_date,
    toDecimal64(amount_bc, 2)                          as amount_signed,        -- credit > 0
    toDecimal64(if(amount_bc < 0, -amount_bc, 0), 2)   as debit_amount,
    toDecimal64(if(amount_bc > 0, amount_bc, 0), 2)    as credit_amount,
    curr                                               as currency,
    invoice_id                                         as invoice_line_id,      -- set on sales/COGS/inventory lines
    open_item_id,
    approved                                           as is_approved,
    source                                             as source_reference,
    memo
from {{ source('lsmb_raw', 'acc_trans') }}
