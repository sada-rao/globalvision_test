-- Creating one on one relationship with the source table. This area is for basic transformation.
select 
     GEOLOCATION_ZIP_CODE_PREFIX
    ,GEOLOCATION_CITY
    ,GEOLOCATION_STATE
    ,GEOLOCATION_LAT
    ,GEOLOCATION_LNG
from {{ source('order_management_system', 'OLIST_GEOLOCATION') }}

