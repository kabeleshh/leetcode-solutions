with a as (select *, id - row_number() over (order by id) as b from Stadium where people >= 100), c as (select *, count(b) over (partition by b) as d from a)

select id, visit_date, people from c
where d > 2;