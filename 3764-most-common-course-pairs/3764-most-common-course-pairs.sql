with top_performer as (select course_name as first_course, lead(course_name) over (partition by user_id) as second_course from course_completions 
where user_id in (select user_id from course_completions group by user_id having count(*) > 4 and avg(course_rating) >= 4))

select *, count(*) as transition_count from top_performer
where second_course is not null
group by first_course, second_course
order by transition_count desc, lower(first_course), lower(second_course);