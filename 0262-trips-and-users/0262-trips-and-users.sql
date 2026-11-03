with unbanned_Users as (select t.id, t.status, t.request_at from Trips t where t.client_id not in (select users_id from Users where banned = 'Yes') and t.driver_id not in (select users_id from Users where banned = 'Yes'))

select u.request_at as "Day", round(sum(case when u.status like 'cancelled%' then 1 else 0 end)::numeric/count(u.status),2) as "Cancellation Rate" from unbanned_Users u
where u.request_at >= '2013-10-01' and u.request_at <= '2013-10-03'
group by u.request_at
order by u.request_at asc;