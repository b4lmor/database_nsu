select 
r."REGION_NAME" as "Region Name",
count(e."EMPLOYEE_ID") as "Employees Number"
from "EMPLOYEES" e 
join "DEPARTMENTS" d on e."DEPARTMENT_ID" = d."DEPARTMENT_ID" 
join "LOCATIONS" l on d."LOCATION_ID" = l."LOCATION_ID" 
join "COUNTRIES" c on l."COUNTRY_ID" = c."COUNTRY_ID" 
join "REGIONS" r on c."REGION_ID" = r."REGION_ID"
where r."REGION_NAME" = 'Europe'
group by r."REGION_ID"
