with sales as (

    select * from {{ ref('fct_sales') }}

),
daily_revenue AS (
SELECT
    DATE(order_purchase_timestamp) AS order_date,
    SUM(payment_value) AS revenue
FROM sales
GROUP BY 1
)

SELECT * FROM daily_revenue