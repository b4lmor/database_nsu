select cf.report_date,
       c.currency_name,
       sum(cf.amount_currency) as "total_amount"
from cash_flow cf
         join currency c on cf.currency_id = c.currency_id
group by c.currency_name, cf.report_date
order by cf.report_date desc

