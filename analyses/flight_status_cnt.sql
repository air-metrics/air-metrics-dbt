{% set flight_status %}
select distinct status
from
 {{ ref('stg_flights__flights') }}
{% endset %}

{% set flight_status_result = run_query(flight_status) %}
{% if execute %}
  {% set important_flight_status = flight_status_result.columns[0].values()  %}
{% else %}
  {% set important_flight_status = [] %}
{% endif %}

select
{% for status_code in important_flight_status -%}
sum(case when status = '{{status_code}}' then 1 else 0 end) as status_{{ status_code | replace(' ', '_') }}
{%- if not loop.last %},{% endif %}
{% endfor -%}
from 
{{ ref('stg_flights__flights')}}
