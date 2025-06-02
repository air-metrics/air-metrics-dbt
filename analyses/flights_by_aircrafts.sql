{% set aircraft_query %}
select distinct aircraft_code
from
 {{ ref('fct_flights') }}
{% endset %}

{% set aircraft_query_result = run_query(aircraft_query) %}
{% if execute %}
  {% set important_aircrafts = aircraft_query_result.columns[0].values()  %}
{% else %}
  {% set important_aircrafts = [] %}
{% endif %}


select
{% for aircraft in important_aircrafts -%}
sum(case when aircraft_code = '{{aircraft}}' then 1 else 0 end) as flights_{{aircraft}}
{%- if not loop.last %},{% endif %}
{% endfor -%}
from 
{{ ref('fct_flights')}}