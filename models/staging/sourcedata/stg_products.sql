-- Creating one on one relationship with the source table. This area is for basic transformation.
select 
    PRODUCT_ID
    ,PRODUCT_CATEGORY_NAME
    ,PRODUCT_DESCRIPTION_LENGTH
    ,PRODUCT_HEIGHT_CM
    ,PRODUCT_LENGTH_CM
    ,PRODUCT_NAME_LENGTH
    ,PRODUCT_PHOTOS_QTY
    ,PRODUCT_WEIGHT_G
    ,PRODUCT_WIDTH_CM
from {{ source('order_management_system', 'OLIST_PRODUCTS') }}