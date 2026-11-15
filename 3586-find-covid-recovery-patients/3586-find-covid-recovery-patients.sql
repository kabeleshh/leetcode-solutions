with a as (select distinct on (patient_id)* from covid_tests where result = 'Positive'),
b as (select c.patient_id, min(c.test_date) as test_date from covid_tests c join a on a.patient_id = c.patient_id where c.result = 'Negative' and a.test_date < c.test_date group by c.patient_id)

select p.patient_id, p.patient_name, p.age, (b.test_date - a.test_date) as recovery_time from patients p
join a on p.patient_id = a.patient_id
join b on p.patient_id = b.patient_id
order by recovery_time asc, p.patient_name asc;