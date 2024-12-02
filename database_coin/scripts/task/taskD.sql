select 
	cf.report_date,
	c.currency_name,
	cf.amount_currency,
	coalesce(cr.currency_rate, 1)
from cash_flow cf 
left join currency_rates cr on cf.report_date = cr.report_date
	and cf.currency_id = cr.currency_id
join currency c on cf.currency_id = c.currency_id
order by cf.report_date, c.currency_name
