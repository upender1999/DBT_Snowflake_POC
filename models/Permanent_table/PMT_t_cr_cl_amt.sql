{{ config(materialized='table') }}

with source_data as (

SELECT  sum(CLAIMED) as t_cl_amt  FROM {{ source('src2', 'policyage') }}
where country = 'CLAY COUNTY'
),
final as(
    select * from source_data
)

select * from final

    
