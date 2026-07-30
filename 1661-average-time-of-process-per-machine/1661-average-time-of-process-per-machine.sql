with a as (select a.machine_id, a.process_id, max(a.timestamp) - min(a.timestamp) as s from Activity a group by a.machine_id,a.process_id)

select machine_id, round((sum(s)::numeric/count(*)),3) as processing_time from a
group by machine_id;