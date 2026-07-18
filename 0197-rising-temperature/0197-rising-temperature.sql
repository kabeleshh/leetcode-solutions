with a as (select w.id, w.recordDate, w.temperature as cur, lag(w.temperature) over (order by w.recordDate) as prev,  recordDate - lag(recordDate) over (order by w.recordDate) as diff from Weather w)

select id as Id from a
where cur > prev and diff = 1;