-- Creating one on one relationship with the source table. This area is for basic transformation.
select 
    ORDER_ID
    ,ORDER_ITEM_ID
    ,PRODUCT_ID
    ,SHIPPING_LIMIT_DATE
    ,COALESCE(PRICE,0) as PRICE
    ,COALESCE(FREIGHT_VALUE,0) as FREIGHT_VALUE
from {{ source('order_management_system', 'OLIST_ORDER_ITEMS') }}