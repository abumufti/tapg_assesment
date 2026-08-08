with z_scores as (

    select * from {{ ref('z_scores') }}

),
anomaly_z3_report AS (
SELECT
    *
FROM z_scores
WHERE ABS(z_score) >= 3
)

SELECT * FROM anomaly_z3_report