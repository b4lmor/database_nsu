select e."FIRST_NAME", COUNT(E."FIRST_NAME") AS count
from "EMPLOYEES" e
WHERE e."FIRST_NAME" IN (select ee."FIRST_NAME" from "EMPLOYEES" ee where ee."EMPLOYEE_ID" != e."EMPLOYEE_ID")
group by e."FIRST_NAME"
order by count, e."FIRST_NAME"