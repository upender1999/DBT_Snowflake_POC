select count(*) as  row_count from {{ ref('Demographics') }} having not row_count >= 0
    