select 
	cf.report_date,
	cf.currency,
	cr.currency_rate 
from cash_flow cf 
left join currency_rates cr on cf.report_date = cr.report_date
	and cf.currency = cr.currency 
where cf.currency in ('EUR', 'USD')
order by cf.report_date, cf.currency 
