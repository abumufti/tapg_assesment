{{ config(
    materialized='table',
    cluster_by=['order_date']
) }}

with daily_revenue as (

    select * from {{ ref('daily_revenue') }}

),
z_scores AS (
SELECT
    purchase_date AS order_date,
    revenue,
    AVG(revenue) OVER () as avg_revenue,
    (revenue - AVG(revenue) OVER ())/ STDDEV(revenue) OVER () AS z_score
FROM daily_revenue
)

SELECT * FROM z_scores