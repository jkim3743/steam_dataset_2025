{{ config(materialized='view') }}

select
  genre_id,
  coalesce(name, genre_name) as genre_name
from read_parquet('{{ env_var("DATA_ROOT") }}/dim_genre.parquet')
