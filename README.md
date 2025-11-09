# Steam Dataset 2025 – Multi-Modal Gaming Analytics

**Goal:** Clean, model, test, and publish analytics-ready tables from the Steam 2025 dataset.

**Architecture:** Raw CSV → Bronze (Parquet) → Silver (dims/bridges/facts) → Gold (KPIs via dbt)

**Reproduce**
1. `python scripts/to_bronze.py`
2. `python scripts/to_silver.py`
3. `cd steam_dataset_2025 && dbt run && dbt test`
4. `dbt docs generate && dbt docs serve` (or visit GitHub Pages link)

**Outputs**
- Silver: `dim_applications`, `dim_genres`, `fact_reviews`, `bridge_app_genre`, …
- Gold: `genre_review_kpis` (+ more)

**Quality**
- dbt tests: `unique`, `not_null`, `relationships` 
