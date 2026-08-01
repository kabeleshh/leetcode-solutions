with a as(select p.project_id as project_id, sum(e.experience_years) as tot, count(p.project_id) as cnt from Project p join Employee e on p.employee_id = e.employee_id group by p.project_id order by project_id asc)

select project_id, round((tot::numeric/cnt),2) as average_years from a;