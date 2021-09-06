-- Set the DataBase to ua_dillards;
DATABASE ua_dillards;
-- Question 3
-- On what day was Dillard’s income based on total sum of purchases the greatest
SELECT TOP 10 SUM(amt) AS income,
    saledate
FROM trnsact
WHERE stype = 'P'
GROUP BY saledate
ORDER BY income DESC;
-- Question 4
-- What is the deptdesc of the departments that have the top 3 greatest
-- numbers of skus from the skuinfo table associated with them?  
SELECT TOP 3 deptinfo.deptdesc AS deptdesc,
    COUNT(skuinfo.sku) as sku_number
FROM skuinfo
    JOIN deptinfo ON deptinfo.dept = skuinfo.dept
GROUP BY deptdesc
ORDER BY sku_number DESC;

-- Question 5
--   Which table contains the most distinct sku numbers?

-- skuinfo
SELECT COUNT(DISTINCT sku) as skuinfo
FROM skuinfo;
-- skstinfo
SELECT COUNT(DISTINCT sku) as skstinfo
FROM skstinfo;
-- trnsact
SELECT COUNT(DISTINCT sku) as trnsact
FROM trnsact;