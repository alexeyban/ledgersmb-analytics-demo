-- One row per general-ledger account, with its heading and the LedgerSMB link roles it carries
-- (AR, AP, IC_sale, IC_cogs, …). Source: account, account_heading, account_link.
with links as (
    select account_id, arraySort(groupArray(description)) as link_roles
    from {{ source('lsmb_raw', 'account_link') }}
    group by account_id
)
select
    a.id                                   as account_id,
    a.accno                                as account_number,
    a.description                          as account_name,
    a.category                             as account_category,        -- A L Q I E
    multiIf(a.category = 'A', 'Asset', a.category = 'L', 'Liability', a.category = 'Q', 'Equity',
            a.category = 'I', 'Income', 'Expense')          as account_category_name,
    a.contra                               as is_contra,
    a.heading                              as heading_id,
    h.accno                                as heading_number,
    h.description                          as heading_name,
    coalesce(l.link_roles, [])             as link_roles,
    -- Debit-normal accounts (assets, expenses) grow with debits; the rest with credits.
    a.category in ('A', 'E')               as is_debit_normal,
    a.obsolete                             as is_obsolete
from {{ source('lsmb_raw', 'account') }} as a
inner join {{ source('lsmb_raw', 'account_heading') }} as h on h.id = a.heading
left join links as l on l.account_id = a.id
