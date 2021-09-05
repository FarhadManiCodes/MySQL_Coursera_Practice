-- Set the DataBase to ua_dillards;
DATABASE ua_dillards;
-- Exercise 7:
--  How many departments have more than 100 brands associated with them,
--  and what are their descriptions?
SELECT count (DISTINCT skuinfo.brand) AS number_of_brands,
        deptinfo.dept,
        deptinfo.deptdesc
FROM skuinfo
JOIN deptinfo 
ON deptinfo.dept = skuinfo.dept
GROUP BY deptinfo.dept,deptinfo.deptdesc
HAVING number_of_brands >= 100;

-- Exercise 8:
--  Write a query that retrieves the department descriptions of each of the skus in the skstinfo
-- table.

SELECT skstinfo.sku AS sku,
        deptinfo.deptdesc AS describ,
        deptinfo.dept as dept

FROM skstinfo 
JOIN skuinfo ON 
skuinfo.sku = skstinfo.sku
JOIN deptinfo ON 
deptinfo.dept = skuinfo.dept
WHERE skstinfo.sku = 5020024

-- OTHER WAY 

SELECT skstinfo.sku AS sku,
        deptinfo.deptdesc AS describ

FROM skstinfo 
JOIN skuinfo ON 
skuinfo.sku = skstinfo.sku
JOIN deptinfo ON 
deptinfo.dept = skuinfo.dept
GROUP BY skstinfo.sku, describ
HAVING skstinfo.sku = 5020024