-- Goods and services with their group and pricing. `is_stocked` = has an inventory account.
select * from {{ ref('stg_lsmb__parts') }}
