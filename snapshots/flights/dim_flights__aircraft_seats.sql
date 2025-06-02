{% snapshot dim_flights__aircraft_seats %}

{{
   config(
       target_schema='snapshot',
       unique_key='aircraft_code',

       strategy='check',
       check_cols = ['aircraft_code', 'seat_no', 'fare_conditions'],
       dbt_valid_to_current="'9999-01-01'::date",
       hard_deletes='new_record',

       snapshot_meta_column_names={
            "dbt_valid_is_deleted": "dbt_is_deleted"
        }

   )
}}

select 
    aircraft_code,
    seat_no,
    fare_conditions
from 
    {{ ref('stg_flights__seats') }}
{% endsnapshot %}