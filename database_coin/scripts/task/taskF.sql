select cr1.report_date,
       'EUR' as "currency_name",
       ROUND(cr1.currency_rate / cr2.currency_rate, 4) as currency_rate
from currency_rates as cr1
         join currency_rates as cr2 on cr1.report_date = cr2.report_date
    and cr1.currency_id = (select c1.currency_id from currency c1 where c1.currency_name = 'EUR')
    and cr2.currency_id = (select c2.currency_id from currency c2 where c2.currency_name = 'USD');
