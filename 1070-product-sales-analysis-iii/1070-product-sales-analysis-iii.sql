with a as(select product_id, min(year) as first_year from Sales group by product_id)

select s.product_id, a.first_year, s.quantity, s.price from Sales s
join a on s.product_id = a.product_id and s.year = a.first_year;