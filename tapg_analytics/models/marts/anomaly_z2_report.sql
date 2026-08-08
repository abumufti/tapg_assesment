with z_scores as (

    select * from {{ ref('z_scores') }}

),
anomaly_z2_report AS (
SELECT
    *
FROM z_scores
WHERE ABS(z_score) >= 2
)

SELECT * FROM anomaly_z2_report