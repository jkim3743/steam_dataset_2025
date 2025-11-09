{{ config(materialized='view') }}

select *
from read_parquet('C:/Users/jkimd/gt/Workspace/Multi-Modal/staging/silver/dim_applications.parquet')
