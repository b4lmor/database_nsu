SELECT D."DEPARTMENT_ID" AS id, D."DEPARTMENT_NAME" AS department, COUNT(E."EMPLOYEE_ID") AS count
FROM "DEPARTMENTS" D
         join public."EMPLOYEES" E on D."DEPARTMENT_ID" = E."DEPARTMENT_ID"
group by D."DEPARTMENT_NAME", D."DEPARTMENT_ID"
HAVING COUNT(*) = (SELECT COUNT(E2."EMPLOYEE_ID")
                   FROM "DEPARTMENTS" D2
                            join public."EMPLOYEES" E2 on D2."DEPARTMENT_ID" = E2."DEPARTMENT_ID"
                   group by D2."DEPARTMENT_NAME"
                   order by COUNT(*) DESC
                   LIMIT 1)
ORDER BY D."DEPARTMENT_NAME" DESC
