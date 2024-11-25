with total_avg_salary as (
	select avg(e."SALARY") as value
	from "EMPLOYEES" e
)
select 
	d."DEPARTMENT_ID" as department_id, 
	coalesce(avg(e."SALARY"), 0) as avg_salary,
	coalesce(avg(e."SALARY"), 0) * 100 / (select nullif(value, 0) from total_avg_salary) as percent 
from "DEPARTMENTS" d 
left join "EMPLOYEES" e on e."DEPARTMENT_ID" = d."DEPARTMENT_ID"
group by d."DEPARTMENT_ID" 
union
select
	0 as department_id,
	coalesce(avg(e."SALARY"), 0) as avg_salary,
	coalesce(avg(e."SALARY"), 0) * 100 / (select nullif(value, 0) from total_avg_salary) as percent
from "EMPLOYEES" e
where e."DEPARTMENT_ID" is null
order by department_id, avg_salary, percent DESC