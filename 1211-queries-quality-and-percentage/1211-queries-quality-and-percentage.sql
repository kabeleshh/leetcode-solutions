select query_name, round(avg(rating::numeric/position),2) as quality, round((sum(case when rating < 3 then 1 else 0 end)::numeric/count(rating))*100,2) as poor_query_percentage from Queries
group by query_name;
