select * from ((select 'Fall' as season, p.category, sum(s.quantity) as total_quantity, sum(s.quantity*s.price) as total_revenue from sales s
join products p on s.product_id = p.product_id
where extract(month from s.sale_date) in (9,10,11)
group by p.category
order by total_quantity desc, total_revenue desc, p.category asc
limit 1)
union
(select 'Spring' as season, p.category, sum(s.quantity) as total_quantity, sum(s.quantity*s.price) as total_revenue from sales s
join products p on s.product_id = p.product_id
where extract(month from s.sale_date) in (3,4,5)
group by p.category
order by total_quantity desc, total_revenue desc, p.category asc
limit 1)
union
(select 'Summer' as season, p.category, sum(s.quantity) as total_quantity, sum(s.quantity*s.price) as total_revenue from sales s
join products p on s.product_id = p.product_id
where extract(month from s.sale_date) in (6,7,8)
group by p.category
order by total_quantity desc, total_revenue desc, p.category asc
limit 1)
union
(select 'Winter' as season, p.category, sum(s.quantity) as total_quantity, sum(s.quantity*s.price) as total_revenue from sales s
join products p on s.product_id = p.product_id
where extract(month from s.sale_date) in (1,2,12)
group by p.category
order by total_quantity desc, total_revenue desc, p.category asc
limit 1))
order by season asc;