{{ config(
    materialized='table',
    cluster_by=['purchase_date']
) }}

with sales as (

    select * from {{ ref('fct_sales') }}

),
daily_revenue AS (
SELECT
    purchase_date,
    SUM(payment_value) AS revenue
FROM sales
GROUP BY 1
)

SELECT * FROM daily_revenue