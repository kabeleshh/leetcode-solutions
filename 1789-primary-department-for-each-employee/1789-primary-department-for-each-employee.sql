with a as(select employee_id, department_id, row_number() over (partition by employee_id order by primary_flag desc) as rnk from Employee)

select employee_id, department_id from a
where rnk = 1;