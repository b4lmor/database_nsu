select distinct
j."JOB_TITLE" as "Job Title"
from "EMPLOYEES" e 
join "JOBS" j on e."JOB_ID" = j."JOB_ID"
join "DEPARTMENTS" d on e."DEPARTMENT_ID" = d."DEPARTMENT_ID" 
join "LOCATIONS" l on d."LOCATION_ID" = l."LOCATION_ID" 
join "COUNTRIES" c on l."COUNTRY_ID" = c."COUNTRY_ID" 
join "REGIONS" r on c."REGION_ID" = r."REGION_ID" 
where r."REGION_NAME" = 'Americas'
order by j."JOB_TITLE" desc 
