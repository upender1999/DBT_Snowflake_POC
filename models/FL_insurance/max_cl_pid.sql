{{ config(materialized='table') }}

with source_data as (

SELECT  d.policyid, max(d.claimed) as claimed,d.country,d.Line FROM {{ source('src1', 'policyage') }} as d

group by d.policyid,d.country,d.line
),
final as(
    select * from source_data
)

select * from final
