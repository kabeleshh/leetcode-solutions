with a as (select num, lag(num) over (order by id) as prev, lead(num) over (order by id) as nxt from Logs)

select distinct num as ConsecutiveNums from a
where num = prev and num = nxt;


--select distinct l.num from Logs l
--group by l.id
--having l.num = lag(l.num) over (order by l.id) and l.num = lead(l.num) over (order by l.id);