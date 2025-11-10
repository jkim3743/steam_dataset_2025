{{ config(materialized='table') }}

select
  r.recommendationid,
  r.appid,
  coalesce(r.voted_up, r.votes_up, 0) as voted_up,
  r.playtime_at_review,
  r.timestamp_created,
  coalesce(r.timestamp_updated, r.timestamp_created) as timestamp_updated,
  a.mat_discount_percent
from {{ ref('stg_reviews') }} r
join {{ ref('dim_applications') }} a
  using (appid);
