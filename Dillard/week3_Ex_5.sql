-- Set the DataBase to ua_dillards;
DATABASE ua_dillards;

-- Exercise 4: 
-- What is Dillard’s average profit per day?
SELECT  trnsact.register as register,
        SUM(trnsact.amt-trnsact.quantity*skstinfo.cost) AS sum_profit,
        count(trnsact.amt) AS number_of_transactions,
        MAX(trnsact.saledate) AS latest_sale,
        MIN(trnsact.saledate) AS  earliest_sale,
        latest_sale - earliest_sale AS duration,
        sum_profit/duration as profit_per_day
FROM trnsact
    INNER JOIN skstinfo ON trnsact.store = skstinfo.store
    AND trnsact.sku = skstinfo.sku
WHERE trnsact.stype = 'P' --only purchase
GROUP BY register
HAVING register=640

-- ADD other approach that is:
-- only days that transaction happened are considered
-- not the duration (THIS IS THE ONE THAT EXERCISE WANTS)
SELECT  trnsact.register as register,
        SUM(trnsact.amt-trnsact.quantity*skstinfo.cost) AS sum_profit,
        count(trnsact.amt) AS number_of_transactions,
        count(distinct trnsact.saledate) AS number_of_days,
        sum_profit/number_of_days as profit_per_day
FROM trnsact
    INNER JOIN skstinfo ON trnsact.store = skstinfo.store
    AND trnsact.sku = skstinfo.sku
WHERE trnsact.stype = 'P' --only purchase
GROUP BY register
HAVING register=640