with least_employees as (
	select count(e."EMPLOYEE_ID") as employees_number
	from "EMPLOYEES" e 
	join "DEPARTMENTS" d on e."DEPARTMENT_ID" = d."DEPARTMENT_ID" 
	group by d."DEPARTMENT_ID"
	order by employees_number asc
	limit 1
)
select
	d."DEPARTMENT_ID" as department_id,
	sum(e."SALARY") as salary_sum
from "EMPLOYEES" e 
join "DEPARTMENTS" d on e."DEPARTMENT_ID" = d."DEPARTMENT_ID" 
group by d."DEPARTMENT_ID"
having count(e."EMPLOYEE_ID") = (select employees_number from least_employees)