with a as (select u.name, count(*), rank() over (order by count(*) desc, u.name asc) as r from Users u join MovieRating mr on u.user_id = mr.user_id group by u.name),
b as (select m.title, avg(mrr.rating), row_number() over (order by avg(mrr.rating) desc, m.title asc) as h from Movies m join MovieRating mrr on m.movie_id = mrr.movie_id where mrr.created_at > '2020-01-31' and mrr.created_at < '2020-03-01' group by m.title)

select name as results from a
where r = 1
union all
select title from b
where h = 1;