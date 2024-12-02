with find_courses_to_usd as (select distinct cr2.currency_id,
                                             cr2.report_date,
                                             round(cr2.currency_rate / cr1.currency_rate, 4) as eq
                             from currency_rates cr1
                                      join currency_rates cr2
                                           on cr1.report_date = cr2.report_date
                                               and
                                              cr1.currency_id =
                                              (select c1.currency_id from currency c1 where c1.currency_name = 'USD'))

select cf.report_date,
       case
           when c.currency_name = 'RUB' THEN 'RUB'
           else 'USD'
           end as "currency",
       sum(
               case
                   when c.currency_name = 'RUB' THEN cf.amount_currency
                   else cf.amount_currency *
                        (select t.eq
                         from find_courses_to_usd t
                         where cf.currency_id = t.currency_id
                           and cf.report_date = t.report_date)
                   end
       )       as "total_amount"
from cash_flow cf
         join currency c on cf.currency_id = c.currency_id
group by cf.report_date,
         CASE
             WHEN c.currency_name = 'RUB' THEN 'RUB'
             ELSE 'USD'
             END
order by cf.report_date desc

