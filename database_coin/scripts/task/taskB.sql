select cf.report_date,
       c.currency_name,
       cf.amount_currency,
       cr.currency_rate
from cash_flow cf
         left join currency_rates cr on cf.report_date = cr.report_date
    and cf.currency_id = cr.currency_id
         join currency c on cf.currency_id = c.currency_id
where c.currency_name = 'EUR';
