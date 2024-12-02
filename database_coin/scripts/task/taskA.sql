select distinct cf.client_name
from cash_flow cf 
where 'USD' not in (
	select currency from cash_flow cf2 
	where cf.client_name = cf2.client_name
)
