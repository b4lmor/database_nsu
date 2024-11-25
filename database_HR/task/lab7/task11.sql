select e."LAST_NAME", COUNT(E."LAST_NAME") AS count
from "EMPLOYEES" e
WHERE e."LAST_NAME" IN (select ee."LAST_NAME" from "EMPLOYEES" ee where ee."EMPLOYEE_ID" != e."EMPLOYEE_ID")
group by e."LAST_NAME"
order by e."LAST_NAME"