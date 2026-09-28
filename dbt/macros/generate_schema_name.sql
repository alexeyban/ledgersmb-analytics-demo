{#- Every model lands in the profile's database (lsmb_analytics), not <target>_<custom>. -#}
{% macro generate_schema_name(custom_schema_name, node) -%}
    {{ target.schema }}
{%- endmacro %}
