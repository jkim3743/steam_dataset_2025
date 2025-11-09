{{ config(materialized='view') }}

select platform_id, platform_name
from read_parquet('{{ env_var("DATA_ROOT") }}/dim_platform.parquet')
