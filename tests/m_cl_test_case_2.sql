select max(CLAIMED) as result from {{ ref('max_cl_pid') }} having  result > 10000
