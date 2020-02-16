{{ config( 
        partition_by='DATE(date_time)' ,  
        materialized='incremental' ) 
}}

with tmp as (
    select * from {{ ref('clickstream_discarded') }}
)

SELECT 
    *
FROM 
    {{ ref('clickstream_full') }} as t1
WHERE 
    exclude_hit = '0'
    AND hit_source NOT IN ('5','7','8','9')

    {{ incremental_filter() }}