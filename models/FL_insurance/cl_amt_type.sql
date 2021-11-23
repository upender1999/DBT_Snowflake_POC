{{ config(materialized='table') }}

with source_data as (

SELECT  max(s.claimed) as claimed,d.ALLIGNMENT FROM {{ source('src1', 'Demographics') }} as d
join
{{ source('src1', 'Stats') }} as s
on d.policyid = s.policyid
group by d.ALLIGNMENT
),
final as(
    select * from source_data
)

select * from final
