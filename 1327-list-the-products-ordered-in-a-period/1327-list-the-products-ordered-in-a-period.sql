select p.product_name, sum(o.unit) as unit from Products p
join Orders o on p.product_id = o.product_id
where extract(month from o.order_date) = 2 and extract(year from o.order_date) = 2020
group by p.product_name
having sum(o.unit) > 99;