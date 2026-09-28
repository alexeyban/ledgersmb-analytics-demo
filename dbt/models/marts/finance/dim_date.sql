-- Calendar from the first to the last posting date, one row per day.
with bounds as (
    select min(posting_date) as d0, max(posting_date) as d1
    from {{ ref('stg_lsmb__journal_lines') }}
)
select
    toDate(d0 + number)                              as date_day,
    toStartOfMonth(toDate(d0 + number))              as month_start,
    toLastDayOfMonth(toDate(d0 + number))            as month_end,
    toYear(toDate(d0 + number))                      as year,
    toQuarter(toDate(d0 + number))                   as quarter,
    toMonth(toDate(d0 + number))                     as month,
    formatDateTime(toDate(d0 + number), '%Y-%m')     as year_month,
    toDayOfWeek(toDate(d0 + number)) >= 6            as is_weekend
from bounds
array join range(toUInt32(dateDiff('day', d0, d1) + 1)) as number
