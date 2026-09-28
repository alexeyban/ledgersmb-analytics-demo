-- Purchasing by vendor and month.
select
    invoice_month                        as month_start,
    vendor_id,
    any(vendor_name)                     as vendor_name,
    uniqExact(transaction_id)            as purchase_invoices,
    toDecimal64(sum(purchase_amount), 2) as spend,
    uniqExact(part_id)                   as distinct_parts
from {{ ref('fct_purchase_lines') }}
group by invoice_month, vendor_id
order by month_start, spend desc
