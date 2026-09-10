with a as (select customer_id, count(payment_method) as total_orders, sum(case when ((extract(hour from order_timestamp) between 11 and 13) or (extract(hour from order_timestamp) between 18 and 20)) then 1 else 0 end) as peak_hr_cnt, avg(order_rating) as avg_rating, count(order_rating) as order_rating_cnt from restaurant_orders group by customer_id)

select customer_id, total_orders, round(((peak_hr_cnt::numeric/total_orders)*100),0) as peak_hour_percentage, round(avg_rating,2) as average_rating from a
where total_orders > 2 and ((peak_hr_cnt::numeric/total_orders)*100) > 59 and round(avg_rating,2) > 3.9 and ((order_rating_cnt::numeric/total_orders)*100) > 49
order by average_rating desc, customer_id desc; 
