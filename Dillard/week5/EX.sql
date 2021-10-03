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