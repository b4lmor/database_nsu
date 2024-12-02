CREATE TEMP TABLE temp_cash_flow
(
    report_date     DATE,
    client_name     VARCHAR(50),
    ccy             CHAR(3),
    amount_currency NUMERIC(20, 4)
);

CREATE TEMP TABLE temp_currency_rates
(
    report_date   DATE,
    ccy           CHAR(3),
    currency_rate NUMERIC(20, 4)
);

COPY temp_cash_flow (report_date, client_name, ccy, amount_currency)
    FROM '/volumes/CASH_FLOW.csv'
    WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY temp_currency_rates (report_date, ccy, currency_rate)
    FROM '/volumes/CURRENCY_RATES.csv'
    WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

INSERT INTO CURRENCY (currency_name)
SELECT DISTINCT *
FROM (SELECT cr.ccy
      FROM temp_currency_rates cr
      UNION
      SELECT cf.ccy
      FROM temp_cash_flow cf) as currencies;

INSERT INTO CASH_FLOW (REPORT_DATE, CLIENT_NAME, CURRENCY_ID, AMOUNT_CURRENCY)
SELECT report_date,
       client_name,
       c.CURRENCY_ID,
       amount_currency
FROM temp_cash_flow t
         JOIN
     CURRENCY c ON t.ccy = c.CURRENCY_NAME;

INSERT INTO CURRENCY_RATES (REPORT_DATE, CURRENCY_ID, CURRENCY_RATE)
SELECT report_date,
       c.CURRENCY_ID,
       currency_rate
FROM temp_currency_rates t
         JOIN CURRENCY c ON t.ccy = c.CURRENCY_NAME;

DROP TABLE temp_cash_flow;
DROP TABLE temp_currency_rates;
