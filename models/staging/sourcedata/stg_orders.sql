-- Creating one on one relationship with the source table. This area is for basic transformation.
select
    order_id,
    customer_id,
    order_status,
    order_purchase_timestamp::Date as order_date
from {{ source('order_management_system', 'OLIST_ORDERS') }}