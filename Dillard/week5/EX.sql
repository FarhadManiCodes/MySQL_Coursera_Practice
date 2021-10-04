-- Select the database
DATABASE ua_dillards

-- Exercise 1. How many distinct dates are there in the saledate column of the 
-- transaction table for each month/year combination in the database?
SELECT
    EXTRACT(YEAR from SALEDATE) AS year_n,
    EXTRACT(MONTH from SALEDATE) AS month_num,
    COUNT(distinct SALEDATE) as number_of_days
FROM 
    TRNSACT
GROUP BY 
    year_n,month_num
ORDER BY 
    year_n,month_num;


-- Exercise 2. Use a CASE statement within an aggregate function
-- to determine which sku had the greatest total sales during 
-- the combined summer months of June, July, and August.
SELECT
    SKU,
    SUM(CASE WHEN EXTRACT(MONTH from saledate) = 6
             THEN sprice
        END) AS total_sale_june,
    SUM(CASE WHEN EXTRACT(MONTH from saledate) = 7
             THEN sprice
        END) AS total_sale_july,
    SUM(CASE WHEN EXTRACT(MONTH from saledate) = 8
             THEN sprice
        END) AS total_sale_aug,
    total_sale_june + 
    total_sale_july +
    total_sale_aug AS total_sale_summer
    
FROM 
    TRNSACT
WHERE
    STYPE = 'P'
GROUP BY sku
ORDER BY total_sale_summer DESC;

-- Exercise 3. How many distinct dates are there in the saledate column of the transaction
-- table for each month/year/store combination in the database? Sort your results by the
-- number of days per combination in ascending order.
SELECT
    STORE,
    EXTRACT(YEAR from SALEDATE) AS year_n,
    EXTRACT(MONTH from SALEDATE) AS month_num,
    COUNT(distinct SALEDATE) as number_of_days
FROM 
    TRNSACT
GROUP BY 
    year_n,month_num,STORE
ORDER BY 
    number_of_days;


-- Exercise 4. What is the average daily revenue for each store/month/year combination in
-- the database? Calculate this by dividing the total revenue for a group by the number of
-- sales days available in the transaction table for that group.
SELECT 
    store, 
	EXTRACT(MONTH FROM saledate) || EXTRACT(YEAR FROM saledate) AS monthYear,
	SUM(amt) AS sumRevenue,
	COUNT(DISTINCT saledate) AS numDays,
	sumRevenue / numDays   AS avgRevenue,
	CASE
		WHEN EXTRACT(MONTH FROM saledate) = 8 AND EXTRACT(YEAR FROM saledate) = 2005
		THEN 'exclude'
		ELSE 'include'
	END AS useDate
FROM 
    trnsact
WHERE 
    stype = 'P' AND useDate = 'include'
GROUP BY 
    monthYear, store, useDate
HAVING 
    numDays > 19
ORDER BY
    avgRevenue;