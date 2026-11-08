with a as (select *, row_number() over (partition by student_id, subject order by exam_date asc) as r1 from Scores), b as (select *, row_number() over (partition by student_id, subject order by exam_date desc) as r2 from Scores)


select a.student_id, a.subject, a.score as first_score, b.score as latest_score from a
join b on a.student_id = b.student_id and a.subject = b.subject
where a.r1 = 1 and b.r2 = 1 and b.score - a.score > 0;