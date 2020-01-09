{{ config( materialized='ephemeral') }}

SELECT 
    t1.date_time
    , t1.visit_num 
    , t1.post_visid_high 
    , t1.post_visid_low
    , t1.hitid_high
    , t1.hitid_low
    , exclude_hit
    , hit_source
    , post_page_url
    , post_pagename
FROM 
    {{ var('dataset') }}.{{ var('click_stream_table') }} as t1
WHERE 
    date_time >= '{{ var("start_date") }}'
    AND date_time <= '{{ var("end_date") }}'