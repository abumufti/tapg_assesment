with daily_revenue as (

    select * from {{ ref('daily_revenue') }}

),
z_scores AS (
SELECT
    order_date,
    revenue,
    (revenue - AVG(revenue) OVER ())/ STDDEV(revenue) OVER () AS z_score
FROM daily_revenue
)

SELECT * FROM z_scores