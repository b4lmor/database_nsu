WITH deps_min_sals as (SELECT MIN(E2."SALARY") as sal, D2."DEPARTMENT_ID"
                       FROM "EMPLOYEES" E2
                                join public."DEPARTMENTS" D2 on E2."EMPLOYEE_ID" = D2."MANAGER_ID"
                       group by D2."DEPARTMENT_ID")

SELECT e."EMPLOYEE_ID", e."LAST_NAME", e."SALARY", D."DEPARTMENT_ID"
FROM "EMPLOYEES" e
         join public."DEPARTMENTS" D on D."DEPARTMENT_ID" = e."DEPARTMENT_ID"
WHERE e."SALARY" = (select m.sal from deps_min_sals as m where D."DEPARTMENT_ID" = m."DEPARTMENT_ID")
ORDER BY D."DEPARTMENT_ID", e."SALARY", e."LAST_NAME"
