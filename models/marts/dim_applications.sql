{{ config(materialized='table') }}

with src as (
  select
    appid,
    name,
    type,
    release_date,
    mat_initial_price,
    mat_final_price,
    is_free,
    platform_windows,
    platform_mac,
    platform_linux
  from {{ ref('stg_applications') }}
)

select
  appid,
  name,
  type,
  release_date,
  mat_initial_price,
  mat_final_price,
  case
    when mat_initial_price is null or mat_initial_price = 0 then 0
    else round(100.0 * (mat_initial_price - mat_final_price) / mat_initial_price, 2)
  end as mat_discount_percent,
  is_free,
  platform_windows,
  platform_mac,
  platform_linux
from src;

