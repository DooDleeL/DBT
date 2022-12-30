{% macro limit_data_in_dev(colunm_name, dev_days_of_data) -%}
{%- if target.name == 'dev' -%}
where {{ colunm_name }} >= DATE_ADD(CURRENT_DATE(), INTERVAL -{{ dev_days_of_data }} DAY)
{%- endif -%}
{%- endmacro %}