{{ config(materialized='view') }}

select
    genre_id,
    name as genre_name
from read_parquet('C:/Users/jkimd/gt/Workspace/Multi-Modal/staging/silver/dim_genre.parquet')
