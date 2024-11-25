with first_level as (
	select e."EMPLOYEE_ID" as employee_id
	from "EMPLOYEES" e 
	where e."MANAGER_ID" is null
),
second_level as (
	select e."EMPLOYEE_ID" as employee_id
	from "EMPLOYEES" e 
	where e."MANAGER_ID" in (select employee_id from first_level)
),
third_level as (
	select e."EMPLOYEE_ID" as employee_id
	from "EMPLOYEES" e 
	where e."MANAGER_ID" in (select employee_id from second_level)
)
select 
	d."DEPARTMENT_NAME" as department_name,
	count(e."EMPLOYEE_ID") filter (where e."EMPLOYEE_ID" in (select employee_id from first_level)) as "Level 1 employees",
	count(e."EMPLOYEE_ID") filter (where e."EMPLOYEE_ID" in (select employee_id from second_level)) as "Level 2 employees",
	count(e."EMPLOYEE_ID") filter (where e."EMPLOYEE_ID" in (select employee_id from third_level)) as "Level 3 employees"
from "EMPLOYEES" e
join "DEPARTMENTS" d on e."DEPARTMENT_ID" = d."DEPARTMENT_ID" 
group by d."DEPARTMENT_ID" 