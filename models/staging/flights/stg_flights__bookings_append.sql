{{ 
config(
	  materialized = 'incremental',
	  incremental_strategy = 'append',
	  tags = ['bookings']
)

}}
select
book_ref,
book_date,
total_amount

from {{ source('demo_src', 'bookings') }}
{% if is_incremental() %}
where
	 ('0x' || book_ref)::bigint > (SELECT MAX(('0x' || book_ref)::bigint) FROM {{ this }})
{% endif %}
    