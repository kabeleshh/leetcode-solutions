with a as (select d.name as Department, e.name as Employee, e.salary as Salary, rank() over (partition by d.name order by e.salary desc) as r from Employee e join Department d on e.departmentId = d.id)

select Department, Employee, Salary from a
where r = 1;