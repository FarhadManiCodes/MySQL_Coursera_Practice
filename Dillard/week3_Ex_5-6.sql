-- Set the DataBase to ua_dillards;
DATABASE ua_dillards;
-- Exercise 5: On what day was the total value (in $) of returned goods the greatest? 
SELECT saledate,
    SUM(amt) AS total_value
FROM trnsact
WHERE stype = 'R'
GROUP BY saledate
ORDER BY total_value DESC;

-- On what day was the total number of individual returned items the greatest?
SELECT saledate,
    COUNT(*) AS num_individual_returns
    FROM trnsact
WHERE stype = 'R'
GROUP BY saledate
ORDER BY num_individual_returns DESC;

-- Exercise 6:
--  What is the maximum price paid for an item in our database?
--  What is the minimum price paid for an item in our database?

SELECT  MAX(sprice)  AS "maximum price",
        MIN(sprice) AS "minimum price"
FROM trnsact
