
--- Load Tables Customers---
TRUNCATE TABLE IF EXISTS TAPG_DB.TAPG_SCHEMA.CUSTOMERS;
COPY INTO TAPG_DB.TAPG_SCHEMA.CUSTOMERS (CUSTOMER_ID, 
    CUSTOMER_UNIQUE_ID, 
    CUSTOMER_ZIP_CODE_PREFIX, 
    CUSTOMER_CITY, 
    CUSTOMER_STATE)
FROM '@"TAPG_DB"."PUBLIC"."TAPG_STAGE"/olist_customers_dataset.csv'
file_format = (
    type = 'CSV'
    field_delimiter = ','
    skip_header = 1
    ); 

--- Load Tables Orders---
TRUNCATE TABLE IF EXISTS TAPG_DB.TAPG_SCHEMA.ORDERS;
COPY INTO TAPG_DB.TAPG_SCHEMA.ORDERS (ORDER_ID,
    CUSTOMER_ID,
    ORDER_STATUS,
    ORDER_PURCHASE_TIMESTAMP,
    ORDER_APPROVED_AT,
    ORDER_DELIVERED_CARRIER_DATE,
    ORDER_DELIVERED_CUSTOMER_DATE,
    ORDER_ESTIMATED_DELIVERY_DATE)
FROM '@"TAPG_DB"."PUBLIC"."TAPG_STAGE"/olist_orders_dataset.csv'
file_format = (
    type = 'CSV'
    field_delimiter = ','
    skip_header = 1
    ); 

--- Create Tables Order Items---
TRUNCATE TABLE IF EXISTS TAPG_DB.TAPG_SCHEMA.ORDER_ITEMS;
COPY INTO TAPG_DB.TAPG_SCHEMA.ORDER_ITEMS (ORDER_ID,
	ORDER_ITEM_ID,
	PRODUCT_ID,
	SELLER_ID,
	SHIPPING_LIMIT_DATE,
	PRICE,
	FREIGHT_VALUE)
FROM '@"TAPG_DB"."PUBLIC"."TAPG_STAGE"/olist_order_items_dataset.csv'
file_format = (
    type = 'CSV'
    field_delimiter = ','
    skip_header = 1
    ); 

--- Create Tables Payments---
TRUNCATE TABLE IF EXISTS TAPG_DB.TAPG_SCHEMA.PAYMENTS;
COPY INTO TAPG_DB.TAPG_SCHEMA.PAYMENTS (ORDER_ID,
	PAYMENT_SEQUENTIAL,
	PAYMENT_TYPE,
	PAYMENT_INSTALLMENTS,
	PAYMENT_VALUE)
FROM '@"TAPG_DB"."PUBLIC"."TAPG_STAGE"/olist_order_payments_dataset.csv'
file_format = (
    type = 'CSV'
    field_delimiter = ','
    skip_header = 1
    ); 

--- Create Tables Products---
TRUNCATE TABLE IF EXISTS TAPG_DB.TAPG_SCHEMA.PRODUCTS;
COPY INTO TAPG_DB.TAPG_SCHEMA.PRODUCTS (PRODUCT_ID,
	PRODUCT_CATEGORY_NAME,
	PRODUCT_NAME_LENGHT,
	PRODUCT_DESCRIPTION_LENGHT,
	PRODUCT_PHOTOS_QTY,
	PRODUCT_WEIGHT_G,
	PRODUCT_LENGTH_CM,
	PRODUCT_HEIGHT_CM,
	PRODUCT_WIDTH_CM)
FROM '@"TAPG_DB"."PUBLIC"."TAPG_STAGE"/olist_products_dataset.csv'
file_format = (
    type = 'CSV'
    field_delimiter = ','
    skip_header = 1
    ); 