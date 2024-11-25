with avg_sal_america as (select avg(e."SALARY") as avg
                         from "EMPLOYEES" e
                                  join public."DEPARTMENTS" D on D."DEPARTMENT_ID" = e."DEPARTMENT_ID"
                                  join public."LOCATIONS" L on L."LOCATION_ID" = D."LOCATION_ID"
                                  join public."COUNTRIES" C on C."COUNTRY_ID" = L."COUNTRY_ID"
                                  join public."REGIONS" R on R."REGION_ID" = C."REGION_ID"
                         where R."REGION_NAME" = 'Americas'),
     avg_dep_sal as (SELECT avg(e."SALARY") avg, D2."DEPARTMENT_ID"
                     from "EMPLOYEES" e
                              join public."DEPARTMENTS" D2 on D2."DEPARTMENT_ID" = e."DEPARTMENT_ID"
                     group by D2."DEPARTMENT_ID")

select d."DEPARTMENT_NAME"
from "DEPARTMENTS" d
where (select a.avg from avg_dep_sal a where d."DEPARTMENT_ID" = a."DEPARTMENT_ID") >
      (select aa.avg from avg_sal_america aa)
order by d."DEPARTMENT_NAME";
