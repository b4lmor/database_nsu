select 
	extract(year from jh."START_DATE") as year,
	count(jh."EMPLOYEE_ID") as employees_number
from "JOB_HISTORY" jh 
group by extract(year from jh."START_DATE")
order by year