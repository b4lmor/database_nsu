select
c."COUNTRY_NAME" as "Country Name",
sum(e."SALARY") as "Salary Sum"
from "EMPLOYEES" e 
join "DEPARTMENTS" d on e."DEPARTMENT_ID" = d."DEPARTMENT_ID" 
join "LOCATIONS" l on d."LOCATION_ID" = l."LOCATION_ID" 
join "COUNTRIES" c on l."COUNTRY_ID" = c."COUNTRY_ID" 
group by c."COUNTRY_ID" 
having c."COUNTRY_NAME" = 'United Kingdom'