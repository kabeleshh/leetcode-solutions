with a as (select product_id, max(change_date) as change_date from Products where change_date<='2019-08-16' group by product_id), b as (select product_id, 10 as price from Products where change_date>'2019-08-16' and product_id not in (select product_id from Products where change_date<='2019-08-16'))

select p.product_id as product_id, p.new_price as price from Products p
join a on p.product_id = a.product_id and p.change_date = a.change_date
union
select product_id, price from b;