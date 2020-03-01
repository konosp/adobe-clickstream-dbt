{{ config( 
    materialized='ephemeral'
) }}

SELECT 
    t1.date_time
    , t1.visit_num 
    , t1.post_visid_high 
    , t1.post_visid_low
    , concat(t1.hitid_high, t1.hitid_low) as unique_hit_id
    , t1.exclude_hit
    , t1.hit_source
    , t1.post_page_url
    , t1.post_pagename
    , t1.visit_start_time_gmt
FROM 
    {{ var('dataset') }}.{{ var('click_stream_table') }} as t1
WHERE 
    date_time >= '{{ var("start_date") }}'
    AND date_time < '{{ var("end_date") }}'

    {{ incremental_filter() }}