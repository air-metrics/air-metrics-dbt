select
  scheduled_departure::date as scheduled_departure,
    count(*) as canceled_flights_cnt
from
  {{ ref('fct_flights') }}
where
  departure_airport = 'MJZ'
  and
  status = 'Cancelled'
group by
  scheduled_departure::date 
  