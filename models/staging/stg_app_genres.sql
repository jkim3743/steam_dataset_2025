{{ config(materialized='view') }}

select *
from read_parquet('{{ env_var("DATA_ROOT", "C:/Users/jkimd/gt/Workspace/Multi-Modal/staging/silver") }}/bridge_app_genre.parquet')
