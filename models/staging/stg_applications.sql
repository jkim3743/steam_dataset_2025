{{ config(materialized='view') }}

select
  cast(appid as integer)                              as appid,
  name,
  coalesce(type, 'game')                              as type,
  try_cast(release_date as date)                      as release_date,
  try_cast(mat_initial_price as double)               as mat_initial_price,
  try_cast(mat_final_price  as double)                as mat_final_price,
  coalesce(is_free, false)                            as is_free,
  coalesce(platform_windows, false)                   as platform_windows,
  coalesce(platform_mac,     false)                   as platform_mac,
  coalesce(platform_linux,   false)                   as platform_linux
from read_parquet('{{ env_var("DATA_ROOT") }}/dim_applications.parquet')
