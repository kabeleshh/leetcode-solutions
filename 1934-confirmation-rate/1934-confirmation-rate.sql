with a as (select c.user_id, count(c.action) as cnt from Confirmations c where c.action = 'confirmed' group by c.user_id), b as (select c.user_id, count(c.action) as cnt_ from Confirmations c group by c.user_id)

select s.user_id, coalesce(round(a.cnt::numeric/b.cnt_, 2),0) as confirmation_rate from Signups s
left join a on s.user_id = a.user_id
left join b on s.user_id = b.user_id;