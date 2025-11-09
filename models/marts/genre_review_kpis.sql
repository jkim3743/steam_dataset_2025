{{ config(materialized='table') }}

with base as (
  select
    g.genre_id,
    dg.genre_name,
    r.voted_up::int as voted_up
  from {{ ref('stg_reviews') }} r
  join {{ ref('stg_app_genres') }} g using (appid)
  join {{ ref('stg_genres') }}   dg using (genre_id)
)
select
  genre_id,
  genre_name,
  count(*)       as review_count,
  avg(voted_up)  as positive_rate
from base
group by 1,2
order by review_count desc
