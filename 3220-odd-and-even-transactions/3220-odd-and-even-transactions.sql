with a as(select transaction_date, sum(amount) as odd_sum from transactions where amount%2 <> 0 group by transaction_date), b as (select transaction_date, sum(amount) as even_sum from transactions where amount%2 = 0 group by transaction_date)

select distinct t.transaction_date, case when a.odd_sum > 0 then a.odd_sum else 0 end as odd_sum, case when b.even_sum > 0 then b.even_sum else 0 end as even_sum from transactions t
left join a on t.transaction_date = a.transaction_date
left join b on t.transaction_date = b.transaction_date
order by t.transaction_date;