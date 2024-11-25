with average_salary_per_department as (
	select e."DEPARTMENT_ID",
	avg(e."SALARY") as "AVERAGE_SALARY"
	from "EMPLOYEES" e 
	group by "DEPARTMENT_ID"
)
select 
	e."EMPLOYEE_ID" as employee_id,
	e."LAST_NAME" as last_name,
	e."SALARY" as salary,
	e."DEPARTMENT_ID" as department_id 
from "EMPLOYEES" e
join average_salary_per_department aspd
on e."DEPARTMENT_ID" = aspd."DEPARTMENT_ID"
where e."SALARY" > aspd."AVERAGE_SALARY"
order by department_id, salary, last_name