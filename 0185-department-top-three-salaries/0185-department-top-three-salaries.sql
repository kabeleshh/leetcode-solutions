with a as ( select d.id,d.name as Department, e.name as Employee, e.salary as Salary, dense_rank() over (partition by d.id order by e.salary desc) as r from Employee e join Department d on e.departmentId = d.id)

select Department, Employee, Salary from a
where r < 4;
