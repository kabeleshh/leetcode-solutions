with a as (select user_id, activity_type, avg(activity_duration) as avg_trail from UserActivity group by user_id, activity_type having activity_type = 'free_trial'), b as (select user_id, activity_type, avg(activity_duration) as avg_paid from UserActivity group by user_id, activity_type having activity_type = 'paid')

select a.user_id, round(a.avg_trail,2) as trial_avg_duration, round(b.avg_paid,2) as paid_avg_duration from a
join b on a.user_id = b.user_id;