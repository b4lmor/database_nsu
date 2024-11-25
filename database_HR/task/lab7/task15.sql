with country_with_max_exp_emp as (select C."COUNTRY_ID"
                                  from "COUNTRIES" C
                                           join public."LOCATIONS" L3 on C."COUNTRY_ID" = L3."COUNTRY_ID"
                                           join public."DEPARTMENTS" D2 on L3."LOCATION_ID" = D2."LOCATION_ID"
                                           join public."EMPLOYEES" E2 on D2."DEPARTMENT_ID" = E2."DEPARTMENT_ID"
                                  where E2."HIRE_DATE" = (select MIN(e."HIRE_DATE") as hire_date
                                                          from "EMPLOYEES" e)
                                  group by C."COUNTRY_ID"),
     sub_salaries as (select e."MANAGER_ID",
                             sum(e."EMPLOYEE_ID") as sum
                      from "EMPLOYEES" e
                      where e."MANAGER_ID" is not null
                      group by e."MANAGER_ID")

select e."EMPLOYEE_ID", (select s.sum from sub_salaries s where s."MANAGER_ID" = e."EMPLOYEE_ID") as sum_subs_salary
from "EMPLOYEES" e
         join public."DEPARTMENTS" D on D."DEPARTMENT_ID" = e."DEPARTMENT_ID"
         join public."LOCATIONS" L on L."LOCATION_ID" = D."LOCATION_ID"
         join public."LOCATIONS" L2 on L2."LOCATION_ID" = D."LOCATION_ID"
         join public."COUNTRIES" C on C."COUNTRY_ID" = L."COUNTRY_ID"
where c."COUNTRY_ID" in (select * from country_with_max_exp_emp)
  AND (select s.sum from sub_salaries s where s."MANAGER_ID" = e."EMPLOYEE_ID") =
      (select s.sum from sub_salaries s order by s.sum desc limit 1)
group by C."COUNTRY_ID", e."EMPLOYEE_ID"
;
