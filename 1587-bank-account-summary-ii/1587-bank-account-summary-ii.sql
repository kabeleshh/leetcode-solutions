with a as (select account, sum(amount) as balance from Transactions group by account having sum(amount) > 10000)

select u.name, a.balance from Users as u
join a on u.account = a.account;