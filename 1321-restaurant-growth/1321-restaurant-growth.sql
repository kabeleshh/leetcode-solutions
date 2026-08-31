with a as (select visited_on, sum(amount) as amount from Customer group by visited_on order by visited_on)

select visited_on, sum(amount) over (rows between 6 preceding and current row) as amount, round(avg(amount) over (rows between 6 preceding and current row) ,2) as average_amount from a offset 6; 