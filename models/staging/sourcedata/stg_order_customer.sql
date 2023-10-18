-- Creating one on one relationship with the source table. This area is for basic transformation.
select 
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state
from {{ source('order_management_system', 'OLIST_ORDER_CUSTOMER') }}
