{{ config(materialized='table') }}

with source_data as (

SELECT policyid,policyjoindate,claimed,insu_amount,CONSTRUCTION FROM {{ source('src1', 'policyage') }}

),
final as(
    select * from source_data
)

select * from final