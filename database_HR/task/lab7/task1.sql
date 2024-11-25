SELECT e."EMPLOYEE_ID", e."HIRE_DATE"
FROM "EMPLOYEES" e
WHERE e."EMPLOYEE_ID" in (select managers."EMPLOYEE_ID" from managers)
  AND e."HIRE_DATE" = (SELECT MIN(E2."HIRE_DATE")
                       from managers m
                                join public."EMPLOYEES" E2 on m."EMPLOYEE_ID" = E2."EMPLOYEE_ID")
ORDER BY e."EMPLOYEE_ID";
