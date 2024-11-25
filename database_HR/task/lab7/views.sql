create view full_locations as
select 
	l."LOCATION_ID",
	l."STREET_ADDRESS",
	l."POSTAL_CODE",
	l."CITY",
	l."STATE_PROVINCE",
	c."COUNTRY_ID",
	c."COUNTRY_NAME",
	r."REGION_ID",
	r."REGION_NAME" 
from "LOCATIONS" l 
join "COUNTRIES" c on l."COUNTRY_ID" = c."COUNTRY_ID"
join "REGIONS" r ON c."REGION_ID" = r."REGION_ID";

create view managers as
select distinct e."MANAGER_ID" as "EMPLOYEE_ID"
from "EMPLOYEES" e
where e."MANAGER_ID" is not null;

-- number of subordinates per employee
create view subordinates as
select 
	e."MANAGER_ID" as "EMPLOYEE_ID",
	count(e."EMPLOYEE_ID") as "SUBORDINATES_NUMBER"
from "EMPLOYEES" e 
group by e."MANAGER_ID"
union -- add employees with 0 subordinates, who are not managers
select 
	e."EMPLOYEE_ID" as "EMPLOYEE_ID",
	0
from "EMPLOYEES" e 
where e."EMPLOYEE_ID" not in (select "EMPLOYEE_ID" from managers);