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

-- Question 7
-- What is the average amount of profit Dillard’s made per day?  
SELECT  SUM(trnsact.amt-trnsact.quantity*skstinfo.cost) AS sum_profit,
        count(trnsact.amt) AS number_of_transactions,
        count(distinct trnsact.saledate) AS number_of_days,
        sum_profit/number_of_days as profit_per_day

FROM trnsact
    INNER JOIN skstinfo ON trnsact.store = skstinfo.store
    AND trnsact.sku = skstinfo.sku
WHERE trnsact.stype = 'P'; --only purchase

-- Question 8

-- The store_msa table provides population statistics about the geographic location around a store. 
-- Using one query to retrieve your answer, how many MSAs are there within the state of North Carolina
-- (abbreviated “NC”), and within these MSAs, 
-- what is the lowest population level (msa_pop) 
-- and highest income level (msa_income)?   
SELECT state,
        COUNT(msa) AS number_of_msa,
        MIN(msa_pop) AS lowest_population_level,
        MAX(msa_income) AS highest_income_level
FROM store_msa
GROUP BY state
HAVING state = 'NC';


-- 9.What department (with department description), brand, style, and color brought 
-- in the greatest total amount of sales?    

SELECT TOP 5 skuinfo.dept AS department,
        deptinfo.deptdesc AS description,
        skuinfo.brand AS brand,
        skuinfo.style AS style,
        skuinfo.color AS color,
        SUM(trnsact.amt) as total_amount

FROM skuinfo 

JOIN trnsact
ON skuinfo.sku = trnsact.sku

JOIN deptinfo ON 
skuinfo.dept = deptinfo.dept

WHERE trnsact.stype = 'P'
GROUP BY department,description,brand,style,color
ORDER BY total_amount DESC;

-- Question 10
-- How many stores have more than 180,000 distinct skus associated with them in the skstinfo table?    
SELECT store, 
        COUNT(DISTINCT sku) AS number_of_skus
FROM skstinfo
GROUP BY store 
HAVING number_of_skus > 180000  

-- Question 11
-- Look at the data from all the distinct skus in the “cop” department with a 
-- “federal” brand and a “rinse wash” color.  
-- You'll see that these skus have the same values in some of the columns, 
-- meaning that they have some features in common.

SELECT *
FROM skuinfo 
JOIN deptinfo 
ON deptinfo.dept = skuinfo.dept

WHERE 
deptinfo.deptdesc = 'cop' AND
skuinfo.brand = 'federal' AND
skuinfo.color = 'rinse wash';

-- In which columns do these skus have different values from one another,
-- meaning that their features differ in the categories represented by the columns?
-- STYLE and SIZE

-- Question 12
-- How many skus are in the skuinfo table, but NOT in the skstinfo table?    
-- When skstinfo is null
SELECT COUNT(DISTINCT skuinfo.sku)
FROM skuinfo
    LEFT JOIN skstinfo ON skuinfo.sku = skstinfo.sku
WHERE skstinfo.sku IS NULL;

-- Question 13
-- In what city and state is the store that had the greatest total sum of sales?
SELECT trnsact.store AS store,
    strinfo.city AS city,
    strinfo.state AS state,
    SUM(trnsact.amt) AS sum_total_sales
FROM trnsact
    INNER JOIN strinfo ON strinfo.store = trnsact.store
WHERE trnsact.stype = 'P' --only purchase
GROUP BY trnsact.store,
    city,
    state
ORDER BY sum_total_sales DESC;

-- Question 15
-- How many states have more than 10 Dillards stores in them?    
SELECT state, count(store) as number_of_stores
FROM strinfo
GROUP BY state 
HAVING count(store) > 10;
