{{ config(
    cluster_by=['purchase_date']
) }}

with customers as (

    select * from {{ ref('stg_customers') }}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

payments as (

    select * from {{ ref('stg_payments') }}

),
items as (

    select * from {{ ref('stg_order_items') }}

),

fct_sales as (
select
    orders.order_id,
    customers.customer_id,
    items.product_id,
    payments.payment_value,
    items.price,
    items.freight_value,
    DATE(orders.order_purchase_timestamp) AS purchase_date,
    TO_NUMBER(TO_CHAR(DATE(orders.order_purchase_timestamp), 'YYYYMMDD')) AS date_id
    
from orders
INNER JOIN  customers ON customers.customer_id = orders.customer_id
LEFT JOIN  items ON items.order_id = orders.order_id
LEFT JOIN  payments ON payments.order_id = orders.order_id
)

select * from fct_sales