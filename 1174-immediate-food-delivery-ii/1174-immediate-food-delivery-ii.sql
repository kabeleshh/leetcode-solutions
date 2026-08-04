with a as (select delivery_id, customer_id, order_date, customer_pref_delivery_date, row_number() over (partition by customer_id order by order_date) as r from Delivery)

select distinct round((((select count(*) from a where r = 1 and order_date = customer_pref_delivery_date)::numeric*100) / ((select count(*) from a where r = 1))),2) as immediate_percentage from a;
