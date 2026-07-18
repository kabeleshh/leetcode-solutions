-- Write your PostgreSQL query statement below
with a as (select o.customer_number, count(o.order_number) as co from Orders o group by o.customer_number)

select customer_number from a
where co  = (select max(co) from a);