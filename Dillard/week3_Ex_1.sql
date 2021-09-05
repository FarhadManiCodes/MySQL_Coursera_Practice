-- Set the DataBase to ua_dillards;
DATABASE ua_dillards;
-- EXample of Group by
SELECT sku,
    COUNT(sku),
    AVG(retail),
    AVG(cost)
FROM skstinfo
GROUP BY sku -- Exercise 1: (a) Use COUNT and DISTINCT to determine how many distinct skus there are in pairs of the
    -- skuinfo, skstinfo, and trnsact tables. Which skus are common to pairs of tables,
    -- or unique to specific tables?
SELECT COUNT(DISTINCT skuinfo.sku),
    COUNT(DISTINCT skstinfo.sku),
    COUNT(DISTINCT trnsact.sku)
FROM skuinfo
    LEFT JOIN skstinfo ON skuinfo.sku = skstinfo.sku
    LEFT JOIN trnsact ON skuinfo.sku = trnsact.sku;
-- Number of distinct sku in each tables
-- skuinfo
SELECT COUNT(DISTINCT sku)
FROM skuinfo;
-- skstinfo
SELECT COUNT(DISTINCT sku)
FROM skstinfo;
-- trnsact
SELECT COUNT(DISTINCT sku)
FROM trnsact;
-- when trnsact is null
SELECT COUNT(DISTINCT skuinfo.sku),
    COUNT(DISTINCT skstinfo.sku),
    COUNT(trnsact.sku)
FROM skuinfo
    LEFT JOIN trnsact ON skuinfo.sku = trnsact.sku
    LEFT JOIN skstinfo ON skuinfo.sku = skstinfo.sku
WHERE trnsact.sku IS NULL;
-- When skstinfo is null
SELECT COUNT(DISTINCT skuinfo.sku),
    COUNT(DISTINCT skstinfo.sku),
    COUNT(DISTINCT trnsact.sku)
FROM skuinfo
    LEFT JOIN trnsact ON skuinfo.sku = trnsact.sku
    LEFT JOIN skstinfo ON skuinfo.sku = skstinfo.sku
WHERE skstinfo.sku IS NULL;
-- HARD LEFT JOIN
SELECT COUNT(DISTINCT skuinfo.sku),
    COUNT(DISTINCT skstinfo.sku),
    COUNT(DISTINCT trnsact.sku)
FROM skuinfo
    LEFT JOIN trnsact ON skuinfo.sku = trnsact.sku
    LEFT JOIN skstinfo ON trnsact.sku = skstinfo.sku;

-- OTHER side
SELECT COUNT(DISTINCT skuinfo.sku),
    COUNT(DISTINCT skstinfo.sku),
    COUNT(DISTINCT trnsact.sku)
FROM skuinfo
    LEFT JOIN skstinfo ON skuinfo.sku = skstinfo.sku
    LEFT JOIN trnsact ON skstinfo.sku = trnsact.sku;

-- How many unique store in strinfo table
SELECT COUNT(DISTINCT store)
FROM strinfo;

-- Exercise 1 b:
-- Use COUNT to determine how many instances there are of each sku associated with each store in the
-- skstinfo table and the trnsact table?
SELECT COUNT(*) AS instances, skstinfo.sku, skstinfo.store 

FROM skstinfo FULL OUTER JOIN trnsact 

ON trnsact.sku= skstinfo.sku AND trnsact.store= skstinfo.store 

GROUP BY skstinfo.sku, skstinfo.store

-- check the oposite
SELECT COUNT(*) AS instances, trnsact.sku, trnsact.store 

FROM skstinfo FULL OUTER JOIN trnsact 

ON trnsact.sku= skstinfo.sku AND trnsact.store= skstinfo.store 

GROUP BY trnsact.sku, trnsact.store