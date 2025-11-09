{{ config(materialized='view') }}

select
  genre_id,
  name as genre_name
from read_parquet('{{ env_var("DATA_ROOT", "C:/Users/jkimd/gt/Workspace/Multi-Modal/staging/silver") }}/dim_genre.parquet')
