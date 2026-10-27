with b as (select player_id, min(event_date) as first_date from Activity group by player_id)

select round(count(a.player_id)::numeric/(select count(distinct b.player_id) from b),2) as fraction from b
join Activity a
on b.player_id = a.player_id and b.first_date + 1 = a.event_date;