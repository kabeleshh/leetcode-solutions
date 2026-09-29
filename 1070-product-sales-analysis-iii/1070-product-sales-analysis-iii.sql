with a as(select product_id, year, quantity, price, rank() over (partition by product_id order by year) as r from Sales)

select product_id, year as first_year, quantity, price from a where r = 1;