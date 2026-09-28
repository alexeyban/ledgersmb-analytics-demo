-- Grain: one journal line. The atomic fact every financial mart aggregates.
select * from {{ ref('int_journal_lines_enriched') }}
