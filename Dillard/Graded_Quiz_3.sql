-- Set the DataBase to ua_dillards;
DATABASE ua_dillards;

-- Question 3
-- On what day was Dillard’s income based on total sum of purchases the greatest
SELECT TOP 10 SUM(amt) AS income, saledate 
FROM trnsact
WHERE stype = 'P'
GROUP BY saledate

ORDER BY income DESC;
