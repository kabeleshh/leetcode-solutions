with a as (select account, sum(amount) as balance from Transactions group by account)

select u.name, a.balance from Users as u
join a on u.account = a.account
where a.balance > 10000;