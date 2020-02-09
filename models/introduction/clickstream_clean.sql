{{ config( partition_by='DATE(date_time)' ) }}

SELECT 
    *
FROM 
    {{ ref('clickstream_full') }} as t1
WHERE 
    exclude_hit = '0'
    AND hit_source NOT IN ('5','7','8','9')