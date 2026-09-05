with a as (select employee_id, rating, c from (select *, row_number() over (partition by employee_id order by review_date desc) as r, count(rating) over (partition by employee_id) as c from performance_reviews) where (r = 1 or r = 3) and c > 2), b as (select employee_id, (lag(rating) over (partition by employee_id) - rating) as improvement_score from a)

select e.employee_id, e.name, b.improvement_score from b
join employees e on e.employee_id = b.employee_id and b.improvement_score is not null and b.improvement_score > 1
order by b.improvement_score desc, e.name asc;