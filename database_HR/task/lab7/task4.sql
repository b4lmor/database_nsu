with avg_salary as (
	select avg(e."SALARY") as avg_salary
	from "EMPLOYEES" e
	join "DEPARTMENTS" d ON e."DEPARTMENT_ID" = d."DEPARTMENT_ID"
	join full_locations fl on d."LOCATION_ID" = fl."LOCATION_ID"
	where lower(fl."REGION_NAME") = lower('Europe')
	and e."EMPLOYEE_ID" in (select "EMPLOYEE_ID" from managers)
),
max_subordinates as (
	select max(s."SUBORDINATES_NUMBER") as max_subordinates
	from subordinates s
)
select
	e."LAST_NAME" as last_name,
	e."FIRST_NAME" as first_name,
	e."SALARY" as salary
from "EMPLOYEES" as e
join "DEPARTMENTS" d on e."DEPARTMENT_ID" = d."DEPARTMENT_ID"
join full_locations fl on d."LOCATION_ID" = fl."LOCATION_ID"
join subordinates s on e."EMPLOYEE_ID" = s."EMPLOYEE_ID"
cross join avg_salary, max_subordinates
where lower(fl."REGION_NAME") = lower('Americas')
and e."SALARY" > avg_salary
and s."SUBORDINATES_NUMBER" = max_subordinates.max_subordinates
order by last_name, first_name