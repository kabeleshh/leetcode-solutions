with a as (select l.num, lag(l.num) over (order by l.id) as prev, lead(l.num) over (order by l.id) as nxt from Logs l)

select distinct num as ConsecutiveNums from a
where num = prev and num = nxt;


--select distinct l.num from Logs l
--group by l.id
--having l.num = lag(l.num) over (order by l.id) and l.num = lead(l.num) over (order by l.id);