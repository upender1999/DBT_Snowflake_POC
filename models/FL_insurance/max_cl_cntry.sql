{{ config(materialized='table') }}

with source_data as (

SELECT  d.policyid,max(s.claimed) as claimed,d.country FROM {{ source('src1', 'Demographics') }} as d
join
{{ source('src1', 'Stats') }} as s
on d.policyid = s.policyid
group by d.country,d.policyid
),
final as(
    select * from source_data
)

select * from final
