with a as (select user_id, count(content_id) as tot_cnt from reactions group by user_id), b as (select user_id, reaction, count(reaction) as react_cnt from reactions group by user_id, reaction)

select a.user_id, b.reaction as dominant_reaction, round((b.react_cnt::numeric/a.tot_cnt),2) as reaction_ratio from a
join b on a.user_id = b.user_id
where a.tot_cnt >= 5 and b.react_cnt::numeric/a.tot_cnt >= 0.6
order by reaction_ratio desc, a.user_id asc;