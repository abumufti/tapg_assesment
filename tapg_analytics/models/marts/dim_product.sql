with dim_product as (

    select 
       PRODUCT_ID,
	   PRODUCT_CATEGORY_NAME AS CATEGORY_NAME,
	   PRODUCT_WEIGHT_G AS WEIGHT_G,
	   PRODUCT_LENGTH_CM AS LENGTH_CM,
	   PRODUCT_HEIGHT_CM AS HEIGHT_CM,
	   PRODUCT_WIDTH_CM AS WIDTH_CM
    from {{ ref('stg_products') }}

)

select * from dim_product