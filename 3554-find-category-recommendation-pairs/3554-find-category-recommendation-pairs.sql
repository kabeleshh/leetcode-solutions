with join_table as (select pp.user_id, pi.category from ProductPurchases pp join ProductInfo pi on pp.product_id = pi.product_id)

select a.category as category1, b.category as category2, count(distinct a.user_id) as customer_count from join_table a
join join_table b
on a.category < b.category and a.user_id = b.user_id
group by a.category, b.category
having count(distinct a.user_id) > 2
order by customer_count desc, a.category asc, b.category asc;