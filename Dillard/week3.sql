-- Set the DataBase to ua_dillards;

DATABASE ua_dillards;

-- EXample of Group by

SELECT sku, COUNT(sku), AVG(retail), AVG(cost)
FROM skstinfo
GROUP BY sku

-- Exercise 1: (a) Use COUNT and DISTINCT to determine how many distinct skus there are in pairs of the
-- skuinfo, skstinfo, and trnsact tables. Which skus are common to pairs of tables,
-- or unique to specific tables?
SELECT COUNT(DISTINCT skuinfo.sku), COUNT(DISTINCT skstinfo.sku), COUNT(DISTINCT trnsact.sku)

FROM skuinfo 
LEFT JOIN skstinfo 
ON skuinfo.sku = skstinfo.sku
LEFT JOIN trnsact
ON skuinfo.sku = trnsact.sku;

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
SELECT COUNT(DISTINCT skuinfo.sku), COUNT(DISTINCT skstinfo.sku), COUNT(trnsact.sku)

FROM skuinfo 
LEFT JOIN trnsact
ON skuinfo.sku = trnsact.sku
LEFT JOIN skstinfo 
ON skuinfo.sku = skstinfo.sku

WHERE trnsact.sku IS NULL;

-- When skstinfo is null
SELECT COUNT(DISTINCT skuinfo.sku), COUNT(DISTINCT skstinfo.sku), COUNT(DISTINCT trnsact.sku)

FROM skuinfo 
LEFT JOIN trnsact
ON skuinfo.sku = trnsact.sku
LEFT JOIN skstinfo 
ON skuinfo.sku = skstinfo.sku

WHERE skstinfo.sku IS NULL;

-- HARD LEFT JOIN
SELECT COUNT(DISTINCT skuinfo.sku), COUNT(DISTINCT skstinfo.sku), COUNT(DISTINCT trnsact.sku)

FROM skuinfo 
LEFT JOIN trnsact
ON skuinfo.sku = trnsact.sku

LEFT JOIN skstinfo 
ON trnsact.sku = skstinfo.sku;

-- OTHER side
-- HARD LEFT JOIN
SELECT COUNT(DISTINCT skuinfo.sku), COUNT(DISTINCT skstinfo.sku), COUNT(DISTINCT trnsact.sku)

FROM skuinfo 

LEFT JOIN skstinfo 
ON skuinfo.sku = skstinfo.sku;

LEFT JOIN trnsact
ON skstinfo.sku = trnsact.sku

