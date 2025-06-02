{{ 
config(
	  materialized = 'table',
	  tags = ['bookings']
)

}}
select
book_ref,
book_date,
total_amount

from {{ source('demo_src', 'bookings') }}

    