with max_dep_per_country as (select count(d."DEPARTMENT_ID") as departments_number
                             from "DEPARTMENTS" d
                                      join "LOCATIONS" l on d."LOCATION_ID" = l."LOCATION_ID"
                                      join "COUNTRIES" c on l."COUNTRY_ID" = c."COUNTRY_ID"
                             group by c."COUNTRY_ID"
                             order by departments_number desc
                             limit 1),
     countries_with_max_deps as (select c."COUNTRY_ID" as country_id
                                 from "COUNTRIES" c
                                          join "LOCATIONS" l on c."COUNTRY_ID" = l."COUNTRY_ID"
                                          join "DEPARTMENTS" d on d."LOCATION_ID" = l."LOCATION_ID"
                                 group by c."COUNTRY_ID"
                                 having
                                     count(d."DEPARTMENT_ID") = (select departments_number from max_dep_per_country)),
     max_sub_by_dep as (select max(s."SUBORDINATES_NUMBER") as subs, E2."DEPARTMENT_ID"
                        from subordinates s
                                 join public."EMPLOYEES" E2 on s."EMPLOYEE_ID" = E2."EMPLOYEE_ID"
                        where E2."DEPARTMENT_ID" is not null
                        GROUP BY E2."DEPARTMENT_ID")

select e."EMPLOYEE_ID",
       (select m.subs from max_sub_by_dep m where e."DEPARTMENT_ID" = m."DEPARTMENT_ID")
from "EMPLOYEES" e
         join "DEPARTMENTS" d on e."DEPARTMENT_ID" = d."DEPARTMENT_ID"
         join "LOCATIONS" l on l."LOCATION_ID" = d."LOCATION_ID"
where l."COUNTRY_ID" in (select country_id from countries_with_max_deps)
  AND (select s."SUBORDINATES_NUMBER" from subordinates s where s."EMPLOYEE_ID" = e."EMPLOYEE_ID") =
      (select mm.subs from max_sub_by_dep mm where mm."DEPARTMENT_ID" = e."DEPARTMENT_ID")
group by l."COUNTRY_ID", e."EMPLOYEE_ID"
ORDER BY e."EMPLOYEE_ID";
