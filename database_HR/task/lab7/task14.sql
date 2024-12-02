with least_exp_employees as (
	select e."EMPLOYEE_ID"
	from "EMPLOYEES" e
	where e."HIRE_DATE" = (
		select max(e."HIRE_DATE")
		from "EMPLOYEES" e
	)
),
countries_with_least_exp_employees as (
	select distinct c."COUNTRY_ID" 
	from "COUNTRIES" c
	join "LOCATIONS" l on c."COUNTRY_ID" = l."COUNTRY_ID"
	join "DEPARTMENTS" d on d."LOCATION_ID" = l."LOCATION_ID"
	join "EMPLOYEES" e on e."DEPARTMENT_ID" = d."DEPARTMENT_ID"
	where e."EMPLOYEE_ID" in (select "EMPLOYEE_ID" from least_exp_employees)
),
max_subordinates_employees_per_country as (
	select 
		c."COUNTRY_ID",
		max(s."SUBORDINATES_NUMBER") as max_subordinates
	from "COUNTRIES" c
	join "LOCATIONS" l on c."COUNTRY_ID" = l."COUNTRY_ID"
	join "DEPARTMENTS" d on d."LOCATION_ID" = l."LOCATION_ID"
	join "EMPLOYEES" e on e."DEPARTMENT_ID" = d."DEPARTMENT_ID"
	join subordinates s on e."EMPLOYEE_ID" = s."EMPLOYEE_ID"
	group by c."COUNTRY_ID"
)
select 
	e."EMPLOYEE_ID" as employee_id,
	s."SUBORDINATES_NUMBER" as subordinates_number
from "COUNTRIES" c
join "LOCATIONS" l on c."COUNTRY_ID" = l."COUNTRY_ID"
join "DEPARTMENTS" d on d."LOCATION_ID" = l."LOCATION_ID"
join "EMPLOYEES" e on e."DEPARTMENT_ID" = d."DEPARTMENT_ID"
join subordinates s on e."EMPLOYEE_ID" = s."EMPLOYEE_ID"
where c."COUNTRY_ID" in (select "COUNTRY_ID" from countries_with_least_exp_employees)
and s."SUBORDINATES_NUMBER" in (select max_subordinates from max_subordinates_employees_per_country)
order by e."EMPLOYEE_ID"