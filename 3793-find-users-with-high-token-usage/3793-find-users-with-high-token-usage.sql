with a as (select user_id as uid ,sum(tokens) as tot, count(*) as cnt from prompts group by uid having count(*) >=3)

select distinct a.uid as user_id, a.cnt as prompt_count, round((a.tot::numeric/a.cnt),2) as avg_tokens from a
join prompts p
on a.uid = p.user_id and p.tokens > round((a.tot::numeric/a.cnt),2)
order by avg_tokens desc, user_id asc;