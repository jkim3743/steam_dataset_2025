{{ config(materialized='table') }}

select
    appid,
    name,
    type,
    is_free,
    release_date,
    mat_initial_price,
    mat_final_price,
    mat_discount_percent,
    mat_achievement_count,
    mat_supports_windows,
    mat_supports_mac,
    mat_supports_linux
from {{ ref('stg_applications') }}
