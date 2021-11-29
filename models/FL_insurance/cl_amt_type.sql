{{ config(materialized='table') }}

with source_data as (

SELECT d.policyid,max(d.claimed) as claimed,d.ALLIGNMENT FROM {{ source('src1', 'policyage') }} as d

group by d.ALLIGNMENT,d.policyid
),
final as(
    select * from source_data
)

select * from final
