SELECT R."REGION_NAME" AS region, ROUND(AVG(E."SALARY"), 2) AS "average salary"
FROM "EMPLOYEES" E
         join public."DEPARTMENTS" D on D."DEPARTMENT_ID" = E."DEPARTMENT_ID"
         join public."LOCATIONS" L on L."LOCATION_ID" = D."LOCATION_ID"
         join public."COUNTRIES" C on C."COUNTRY_ID" = L."COUNTRY_ID"
         join public."REGIONS" R on R."REGION_ID" = C."REGION_ID"
WHERE LOWER(R."REGION_NAME") = LOWER('europe')
GROUP BY R."REGION_NAME"
