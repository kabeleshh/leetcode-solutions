with a as( select p.product_id, sum(p.price*u.units) as tot, sum(u.units) as t_unit from Prices p
left join UnitsSold u on p.product_id = u.product_id and p.start_date <= u.purchase_date and p.end_date >= u.purchase_date group by p.product_id), b as (select product_id,round((tot::numeric/t_unit),2) as average_price from a)

select product_id, case when average_price is null then 0 else average_price end from b;