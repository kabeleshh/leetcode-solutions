with a as (select session_id, user_id, extract(epoch from (max(event_timestamp) - min(event_timestamp)))/60 as session_duration_minutes, sum(case when event_type = 'click' then 1 else 0 end) as click_count, sum(case when event_type = 'scroll' then 1 else 0 end) as scroll_count from app_events
group by session_id,user_id 
having session_id not in(select session_id from app_events where event_type = 'purchase'))

select session_id, user_id, session_duration_minutes, scroll_count from a
where session_duration_minutes > 30 and scroll_count > 4 and click_count::numeric/scroll_count < 0.2
order by scroll_count desc, session_id asc;