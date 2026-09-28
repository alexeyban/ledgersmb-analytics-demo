{#
  Generic test: a staging model has exactly as many rows as the raw table it reads. Guards against a
  join silently dropping or duplicating rows. Returns one row (the two counts) when they differ.
#}
{% test equal_rowcount_to_source(model, source_name, table_name) %}
select a.n as model_rows, b.n as source_rows
from (select count() as n from {{ model }}) as a
cross join (select count() as n from {{ source(source_name, table_name) }}) as b
where a.n != b.n
{% endtest %}
