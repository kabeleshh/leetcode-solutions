with a as(select d.driver_id, d.driver_name, avg(t.distance_km/t.fuel_consumed) as first_half from drivers d join trips t on d.driver_id = t.driver_id where extract(MONTH from t.trip_date) between 1 and 6 group by d.driver_id, d.driver_name), b as (select d.driver_id, d.driver_name, avg(t.distance_km/t.fuel_consumed) as second_half from drivers d join trips t on d.driver_id = t.driver_id where extract(MONTH from t.trip_date) between 7 and 12 group by d.driver_id, d.driver_name)

select a.driver_id, a.driver_name, round(a.first_half,2) as first_half_avg, round(b.second_half,2) as second_half_avg, round((b.second_half - a.first_half),2) as efficiency_improvement from a
join b
on a.driver_id = b.driver_id
where b.second_half - a.first_half > 0
order by efficiency_improvement desc, a.driver_name asc;