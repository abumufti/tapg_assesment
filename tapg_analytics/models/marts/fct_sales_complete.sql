{{ config(
    cluster_by=['purchase_date']
) }}

with fct_sales as (

    select * from {{ ref('fct_sales') }}

),
dim_customer as (

    select * from {{ ref('dim_customer') }}

),
dim_date as (

    select * from {{ ref('dim_date') }}

),
dim_product as (

    select * from {{ ref('dim_product') }}

),

fct_sales_complete as (
select
    fct_sales.order_id,
    dim_customer.customer_id,
    dim_customer.unique_id,
	dim_customer.zip_code,
	dim_customer.city,
	dim_customer.state,
    fct_sales.product_id,
    dim_product.category_name,
    dim_product.weight_g,
    dim_product.length_cm,
    dim_product.height_cm,
    dim_product.width_cm,
    payment_value,
    price,
    freight_value,
    purchase_date,
    fct_sales.date_id,
    dim_date.year,
    dim_date.month,
    dim_date.month_name,
    dim_date.day_name,
    dim_date.is_weekend

from fct_sales
INNER JOIN  dim_customer ON dim_customer.customer_id = fct_sales.customer_id
INNER JOIN  dim_product ON dim_product.product_id = fct_sales.product_id
INNER JOIN  dim_date ON dim_date.date_id = fct_sales.date_id
)

select * from fct_sales_complete