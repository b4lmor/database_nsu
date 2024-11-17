select
jh."EMPLOYEE_ID" as "Employee ID"
from "JOB_HISTORY" jh
group by jh."EMPLOYEE_ID" 
having count(jh."EMPLOYEE_ID") >= 2
order by jh."EMPLOYEE_ID" 
