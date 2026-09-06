with buy as (select stock_name, sum(price) as b from Stocks where operation = 'Buy' group by stock_name, operation), sell as (select stock_name, sum(price) as s from Stocks where operation = 'Sell' group by stock_name, operation)

select buy.stock_name, (sell.s - buy.b) as capital_gain_loss from buy
join sell on buy.stock_name = sell.stock_name;