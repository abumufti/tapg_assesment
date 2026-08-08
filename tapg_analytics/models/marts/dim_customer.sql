with dim_customer as (

    select 
       CUSTOMER_ID AS customer_id,
	   CUSTOMER_UNIQUE_ID AS unique_id,
	   CUSTOMER_ZIP_CODE_PREFIX AS zip_code,
	   CUSTOMER_CITY AS city,
	   CUSTOMER_STATE AS state
    from {{ ref('stg_customers') }}

)

select * from dim_customer