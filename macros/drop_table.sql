{% macro drop(table_name) %}
    {% set sql_drop %}

        use role {{ target.role }};
        use warehouse {{ target.warehouse }};
        
        drop table {{ table_name }};

    {% endset %}
    {% do run_query(sql_drop) %}
{% endmacro %}


