with a as (select distinct on (user_id)* from subscription_events order by user_id, event_date desc, event_type asc),
b as (select user_id, max(event_date) - min(event_date) as days_as_subscriber, max(monthly_amount) as max_historical_amount from subscription_events where user_id in (select user_id from subscription_events where event_type = 'downgrade') group by user_id)

select a.user_id, a.plan_name as current_plan, a.monthly_amount as current_monthly_amount, b.max_historical_amount, b.days_as_subscriber from a
join b on a.user_id = b.user_id
where a.event_type <> 'cancel' and a.monthly_amount::numeric/b.max_historical_amount < 0.5 and b.days_as_subscriber > 59
order by b.days_as_subscriber desc, a.user_id asc;