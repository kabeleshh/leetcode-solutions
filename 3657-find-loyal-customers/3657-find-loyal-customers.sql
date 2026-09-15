with a as (select customer_id, count(transaction_type) as pur_cnt from customer_transactions group by customer_id having count(case when transaction_type = 'purchase' then 1 else 0 end) > 2 and max(transaction_date) - min(transaction_date) > 29), b as (select customer_id, sum(case when transaction_type = 'refund' then 1 else 0 end) as refund_cnt from customer_transactions group by customer_id), c as (select customer_id, count(transaction_type) as tot_cnt from customer_transactions group by customer_id)

select a.customer_id from a 
join b on a.customer_id = b.customer_id
join c on b.customer_id = c.customer_id
where ((b.refund_cnt::numeric/c.tot_cnt)*100) < 20
order by customer_id asc;