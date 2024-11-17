select 
c."COUNTRY_ID" as "Country ID",
c."COUNTRY_NAME" as "Country Name",
count(d."DEPARTMENT_ID") as "Departments Number"
from "DEPARTMENTS" d 
join "LOCATIONS" l on d."LOCATION_ID" = l."LOCATION_ID"
join "COUNTRIES" c on l."COUNTRY_ID" = c."COUNTRY_ID"
group by c."COUNTRY_ID"
order by c."COUNTRY_ID" asc