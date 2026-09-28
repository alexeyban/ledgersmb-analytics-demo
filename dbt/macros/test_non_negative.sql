{#
  Generic test: the column is never negative. Returns the offending rows.
  Usage (schema.yml):  tests: [non_negative]
#}
{% test non_negative(model, column_name) %}
select * from {{ model }} where {{ column_name }} < 0
{% endtest %}
