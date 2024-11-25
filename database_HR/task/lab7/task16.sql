with hire_year as (select extract(year from e."HIRE_DATE") as year,
                          count(*)                         as count
                   from "EMPLOYEES" e
                   group by year)

select h.count, h.year
from hire_year h
where h.count = (select max(hh.count) from hire_year hh)

