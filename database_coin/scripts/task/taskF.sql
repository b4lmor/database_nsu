select 
    cr.report_date,
    cr.currency,
    cr.currency_rate / cr2.currency_rate as currency_rate
from currency_rates as cr
join currency_rates as cr2 on cr.report_date = cr2.report_date
    and cr.currency = 'EUR' and cr2.currency = 'USD';

