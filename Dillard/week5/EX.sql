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