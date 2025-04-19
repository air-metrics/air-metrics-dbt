{{ 
config(
	  materialized='table'
	  ) 
}}
select
  ticket_no,
  book_ref,
  passenger_id,
  passenger_name,
  contact_data
from {{ source('demo_src', 'tickets') }}
 
    