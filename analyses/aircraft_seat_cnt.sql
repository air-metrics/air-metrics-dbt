select 
aircraft_code,
  count(*) as seat_cnt
from
{{ ref('stg_flights__seats') }}
group by aircraft_code
order by seat_cnt desc