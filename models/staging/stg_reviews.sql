{{ config(materialized='view') }}

select *
from read_parquet('{{ env_var("DATA_ROOT") }}/fact_reviews.parquet')
