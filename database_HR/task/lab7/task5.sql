select d."DEPARTMENT_ID",
       coalesce(sum(e."SALARY"), 0)                                                     as sum_salary,
       coalesce(sum(e."SALARY"), 0) * 100 / (select sum(e."SALARY") from "EMPLOYEES" e) as total_percent
from "DEPARTMENTS" d
         left join public."EMPLOYEES" E on d."DEPARTMENT_ID" = E."DEPARTMENT_ID"
group by d."DEPARTMENT_ID"
order by total_percent;
