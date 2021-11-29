{{ config(materialized='table') }}

with source_data as (

SELECT  sum(INSU_AMOUNT) as t_ins_amt,
        sum(CLAIMED) as t_cl_amt, (sum(INSU_AMOUNT)-sum(CLAIMED)) as act_amt FROM {{ source('src1', 'policyage') }}

),
final as(
    select * from source_data
)

select * from final

