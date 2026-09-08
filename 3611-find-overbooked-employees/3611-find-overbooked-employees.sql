with a as (select employee_id, sum(duration_hours) as meeting_hrs_per_week from meetings group by employee_id, extract(YEAR from meeting_date), extract(WEEK from meeting_date))

select e.employee_id, e.employee_name, e.department, count(a.meeting_hrs_per_week) as meeting_heavy_weeks from employees e
join a on e.employee_id = a.employee_id
where meeting_hrs_per_week > 20
group by e.employee_id, e.employee_name, e.department
having count(a.meeting_hrs_per_week) > 1
order by meeting_heavy_weeks desc, e.employee_name asc;