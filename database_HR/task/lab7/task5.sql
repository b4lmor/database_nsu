with sum_sal as (select sum(e."SALARY") as sal
                 from "EMPLOYEES" e)

select coalesce(sum(e."SALARY"), 0) as sum_salary,
       coalesce(sum(e."SALARY"), 0) * 100 / (select s.sal from sum_sal as s) as total_percent
from "DEPARTMENTS" d
         left join public."EMPLOYEES" E on d."DEPARTMENT_ID" = E."DEPARTMENT_ID"
group by d."DEPARTMENT_ID"
order by total_percent;
