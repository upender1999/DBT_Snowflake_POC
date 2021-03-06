{{ config(materialized='table') }}

with source_data as (

SELECT policyid,country,statecode,line,ALLIGNMENT FROM {{ source('src1', 'policyage') }}

),
final as(
    select * from source_data
)

select * from final