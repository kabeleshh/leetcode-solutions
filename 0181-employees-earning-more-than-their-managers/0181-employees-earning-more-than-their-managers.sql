with a as (select e1.id, e1.name, e1.salary, e1.managerId from Employee e1)

select a.name as Employee from a
join Employee e
on a.managerId = e.id
where a.salary > e.salary;