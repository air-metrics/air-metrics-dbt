{{ 
    config(
        materialized='table'
    ) 
}}

select 
city,
region
from {{ ref('city_region') }}
