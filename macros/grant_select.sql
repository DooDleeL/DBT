{% macro grant_select(schema=target.schema, role=target.role) %}
    
    {% set query %}
        grant usage on schema {{ schema }} to role {{ role }};
        grant select on all tables in schema {{ schema }} to role {{ role }};
        grant select on all views in schema {{ schema }} to role {{ role }};
    {% endset %}

    {{ log('Granting select and views in schema ' ~ schema ~ ' to role ' ~ role, info=true) }}
    {% do run_query(query) %}
    {{ log('Privileges granted!', info=true) }}

{% endmacro %}