{{ config( 
        partition_by='DATE(date_time)' ,  
        materialized='incremental' ,
        unique_key = 'unique_hit_id' )
}}

SELECT 
    *
FROM 
    {{ ref('clickstream_full') }} as t1
WHERE 
    exclude_hit != '0'
    OR hit_source IN ('5','7','8','9')

    {{ incremental_filter() }}