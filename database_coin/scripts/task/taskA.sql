select distinct cf.client_name
from cash_flow cf
where (select c.currency_id
       from currency c
       where c.currency_name = 'USD')
          not in
      (select currency_id
       from cash_flow cf2
       where cf.client_name = cf2.client_name)
