{#
  Generic test: a boolean expression holds on every row. Returns the rows where it does not.
  Usage:  tests: [{expression_is_true: {expression: "debit_amount = 0 or credit_amount = 0"}}]
#}
{% test expression_is_true(model, expression) %}
select * from {{ model }} where not ({{ expression }})
{% endtest %}
