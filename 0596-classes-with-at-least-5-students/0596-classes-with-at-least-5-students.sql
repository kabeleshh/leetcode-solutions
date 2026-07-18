-- Write your PostgreSQL query statement below
select c.class from Courses c
group by c.class 
having count(*) >= 5;