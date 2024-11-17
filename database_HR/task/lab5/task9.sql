select
d."DEPARTMENT_ID" as "Department ID",
count(e."EMPLOYEE_ID") as "Managers Number"
from "EMPLOYEES" e
join "DEPARTMENTS" d on e."DEPARTMENT_ID" = d."DEPARTMENT_ID"
where e."EMPLOYEE_ID" in (
	select distinct mgr."EMPLOYEE_ID" as "Manager ID"
	from "EMPLOYEES" e
	join "EMPLOYEES" mgr on e."MANAGER_ID" = mgr."EMPLOYEE_ID"
)
group by d."DEPARTMENT_ID"
order by "Managers Number"
