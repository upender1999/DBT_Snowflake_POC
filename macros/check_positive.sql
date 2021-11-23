{% test check_positive(model, column_name) %}

with validation as (

    select {{ column_name }} as col from {{ model }}

),

validation_errors  as (

    select col from validation where col < 0


)

select * from validation_errors

{% endtest %}