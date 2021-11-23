{% macro post_hook_seed(table_name, target_table_name) %}
    {% set sql_post_hook_seed %}

        use role {{ target.role }};
        use warehouse {{ target.warehouse }};
        use database {{ target.database }};
        use schema {{ target.schema }};
        
        drop table if exists {{ target_table_name }};
        alter table {{ table_name }} rename to {{ target_table_name }};
        commit;
    {% endset %}
    {% do run_query(sql_post_hook_seed) %}
{% endmacro %}
