-- Creating one on one relationship with the source table. This area is for basic transformation.
select 
    seller_id,
    seller_city,
    seller_state,
    seller_zip_code_prefix
from {{ source('order_management_system', 'OLIST_SELLERS') }}
