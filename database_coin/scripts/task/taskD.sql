select 
	cf.report_date,
	cf.currency,
	cf.amount_currency,
	coalesce(cr.currency_rate, 1)
from cash_flow cf 
left join currency_rates cr on cf.report_date = cr.report_date
	and cf.currency = cr.currency 
order by cf.report_date, cf.currency 
