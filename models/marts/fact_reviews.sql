{{ config(materialized='table') }}

select
    r.recommendationid,
    r.appid,
    r.voted_up,
    r.votes_up,
    r.votes_funny,
    r.timestamp_created,
    r.timestamp_updated,
    a.name as app_name,
    a.is_free,
    a.release_date,
    a.mat_final_price,
    a.mat_discount_percent
from {{ ref('stg_reviews') }} as r
left join {{ ref('stg_applications') }} as a
  on r.appid = a.appid
