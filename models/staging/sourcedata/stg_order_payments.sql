-- Creating one on one relationship with the source table. This area is for basic transformation.
select
    ORDER_ID
    ,PAYMENT_INSTALLMENTS
    ,PAYMENT_SEQUENTIAL
    ,PAYMENT_TYPE
    ,COALESCE(PAYMENT_VALUE,0) as PAYMENT_VALUE
from {{ source('order_management_system', 'OLIST_ORDER_PAYMENTS') }}