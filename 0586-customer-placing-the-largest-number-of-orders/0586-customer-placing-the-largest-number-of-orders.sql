with a as (select customer_number, count(order_number) as co from Orders group by customer_number)

select customer_number from a
where co  = (select max(co) from a);