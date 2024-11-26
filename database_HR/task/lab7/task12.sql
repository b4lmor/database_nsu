with max_dep_per_country as (
	select count(d."DEPARTMENT_ID") as departments_number
	from "DEPARTMENTS" d
	join "LOCATIONS" l on d."LOCATION_ID" = l."LOCATION_ID"
	join "COUNTRIES" c on l."COUNTRY_ID" = c."COUNTRY_ID"
	group by c."COUNTRY_ID"
	order by departments_number desc
	limit 1
),
max_salary_in_country as (
	select 
		c."COUNTRY_ID",
		max(e."SALARY") as max_salary
	from "DEPARTMENTS" d 
	join "EMPLOYEES" e on e."DEPARTMENT_ID" = d."DEPARTMENT_ID"
	join "LOCATIONS" l on l."LOCATION_ID" = d."LOCATION_ID"
	join "COUNTRIES" c on c."COUNTRY_ID" = l."COUNTRY_ID"
	group by c."COUNTRY_ID"
),
countries_with_max_deps as (
	select
		c."COUNTRY_ID" as country_id
	from "COUNTRIES" c 
	join "LOCATIONS" l on c."COUNTRY_ID" = l."COUNTRY_ID"
	join "DEPARTMENTS" d on d."LOCATION_ID" = l."LOCATION_ID"
	group by c."COUNTRY_ID"
	having count(d."DEPARTMENT_ID") = (select departments_number from max_dep_per_country)
)
select 
	l."COUNTRY_ID" as country_id,
	e."EMPLOYEE_ID" as employee_id
from "EMPLOYEES" e
join "DEPARTMENTS" d on e."DEPARTMENT_ID" = d."DEPARTMENT_ID"
join "LOCATIONS" l on l."LOCATION_ID" = d."LOCATION_ID"
join max_salary_in_country msic on msic."COUNTRY_ID" = l."COUNTRY_ID" 
where l."COUNTRY_ID" in (select country_id from countries_with_max_deps)
and e."SALARY" = msic.max_salary
group by l."COUNTRY_ID", e."EMPLOYEE_ID"
order by country_id, employee_id
