with geolocation as (
    select 
     GEOLOCATION_ZIP_CODE_PREFIX
    ,GEOLOCATION_CITY
    ,GEOLOCATION_STATE
    ,GEOLOCATION_LAT
    ,GEOLOCATION_LNG
from {{ ref('stg_geolocation') }}
)
select * from geolocation