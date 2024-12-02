SELECT J."JOB_ID", COUNT(E."EMPLOYEE_ID") AS count FROM "JOBS" J
JOIN public."EMPLOYEES" E on J."JOB_ID" = E."JOB_ID"
GROUP BY J."JOB_ID"
ORDER BY count