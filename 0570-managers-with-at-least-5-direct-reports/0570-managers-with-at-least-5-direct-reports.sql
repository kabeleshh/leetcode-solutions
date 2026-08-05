with a as(select managerId, count(*) from Employee group by managerId having count(*)>=5)

select e.name from Employee e
join a
on e.id = a.managerId;