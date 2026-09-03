with exp as (select store_id, product_name, quantity, price from (select *, row_number() over (partition by store_id order by price desc) as r, count(*) over (partition by store_id) as c from inventory) where r = 1 and c > 2), cheap as (select store_id, product_name, quantity, price from (select *, row_number() over (partition by store_id order by price asc) as r, count(*) over (partition by store_id) as c from inventory) where r = 1 and c >2)

select s.store_id, s.store_name, s.location, exp.product_name as most_exp_product, cheap.product_name as cheapest_product, round((cheap.quantity::numeric/exp.quantity),2) as imbalance_ratio from stores as s
join exp on s.store_id = exp.store_id
join cheap on s.store_id = cheap.store_id
where exp.quantity < cheap.quantity
order by imbalance_ratio desc, s.store_name asc;