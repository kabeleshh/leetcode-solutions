with a as (select reports_to, count(name) as reports_count, round(avg(age)) as average_age from Employees group by reports_to)

select e.employee_id, e.name, a.reports_count, a.average_age from Employees e
join a on e.employee_id = a.reports_to
order by employee_id asc;