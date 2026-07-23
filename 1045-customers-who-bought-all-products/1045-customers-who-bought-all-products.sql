with a as(select c.customer_id, count(distinct p.product_key) as tot_cnt from Customer c join Product p on c.product_key = p.product_key group by c.customer_id)

select customer_id from a
where tot_cnt = (select count(*) from Product);