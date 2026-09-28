-- Customers and vendors. In LedgerSMB a company (entity) holds one or more credit accounts
-- (entity_credit_account); the credit account is what AR/AP documents point at, so it is the grain.
select
    eca.id                                          as counterparty_id,
    eca.meta_number                                 as account_code,
    c.legal_name                                    as counterparty_name,
    if(eca.entity_class = 1, 'vendor', 'customer')  as counterparty_type,
    b.description                                   as segment,
    eca.terms                                       as payment_terms_days,
    toDecimal64(coalesce(eca.creditlimit, 0), 2)    as credit_limit,
    eca.curr                                        as currency,
    eca.startdate                                   as start_date,
    loc.city as city,
    loc.state as state
from {{ source('lsmb_raw', 'entity_credit_account') }} as eca
inner join {{ source('lsmb_raw', 'company') }} as c on c.entity_id = eca.entity_id
left join {{ source('lsmb_raw', 'business') }} as b on b.id = eca.business_id
left join {{ source('lsmb_raw', 'eca_to_location') }} as el on el.credit_id = eca.id and el.location_class = 1
left join {{ source('lsmb_raw', 'location') }} as loc on loc.id = el.location_id
