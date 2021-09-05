-- Set the DataBase to ua_dillards;
DATABASE ua_dillards;
--Exercise 3
-- Examine some of the rows in the trnsact table that are not in the skstinfo table;
-- can you find any common features that could explain why the cost information is missing?
SELECT *
FROM trnsact
    LEFT JOIN skstinfo ON trnsact.store = skstinfo.store
    AND trnsact.sku = skstinfo.sku
WHERE skstinfo.sku IS NULL;
-- Check the S type in the trnsact table --> 
-- R :4141230
-- P :48197610
SELECT trnsact.stype,count(*)
FROM trnsact
    LEFT JOIN skstinfo ON trnsact.store = skstinfo.store
    AND trnsact.sku = skstinfo.sku
WHERE skstinfo.sku IS NULL
GROUP BY trnsact.stype;

-- check the original price and sale price
SELECT *
FROM trnsact
    LEFT JOIN skstinfo ON trnsact.store = skstinfo.store
    AND trnsact.sku = skstinfo.sku
WHERE skstinfo.sku IS NULL
AND trnsact.orgprice < trnsact.sprice 

-- GROUP BY trnsact.INTERID 
-- 000000000 : 32256490
SELECT trnsact.interid,count(*) as interies
FROM trnsact
    LEFT JOIN skstinfo ON trnsact.store = skstinfo.store
    AND trnsact.sku = skstinfo.sku
WHERE skstinfo.sku IS NULL
GROUP BY trnsact.interid
ORDER BY interies DESC;


-- GROUP BY trnsact.mic
SELECT trnsact.mic,count(*) as interies
FROM trnsact
    LEFT JOIN skstinfo ON trnsact.store = skstinfo.store
    AND trnsact.sku = skstinfo.sku
WHERE skstinfo.sku IS NULL
GROUP BY trnsact.mic
ORDER BY interies DESC;


-- GROUP BY trnsact.quantity
-- 1: 52338837
-- 82:1
-- 10:1
-- 70:1

SELECT trnsact.quantity,count(*) as interies
FROM trnsact
    LEFT JOIN skstinfo ON trnsact.store = skstinfo.store
    AND trnsact.sku = skstinfo.sku
WHERE skstinfo.sku IS NULL
GROUP BY trnsact.quantity
ORDER BY interies DESC;

-- GROUP BY trnsact.trannum
SELECT trnsact.trannum,count(*) as interies
FROM trnsact
    LEFT JOIN skstinfo ON trnsact.store = skstinfo.store
    AND trnsact.sku = skstinfo.sku
WHERE skstinfo.sku IS NULL
GROUP BY trnsact.trannum
ORDER BY interies DESC;


-- GROUP BY trnsact.store
SELECT trnsact.store,count(*) as interies
FROM trnsact
    LEFT JOIN skstinfo ON trnsact.store = skstinfo.store
    AND trnsact.sku = skstinfo.sku
WHERE skstinfo.sku IS NULL
GROUP BY trnsact.store
ORDER BY interies DESC;


-- GROUP BY trnsact.register
SELECT trnsact.register,count(*) as interies
FROM trnsact
    LEFT JOIN skstinfo ON trnsact.store = skstinfo.store
    AND trnsact.sku = skstinfo.sku
WHERE skstinfo.sku IS NULL
GROUP BY trnsact.register
ORDER BY interies DESC;


-- check the original price and sale price and GROUP 

-- 215131:The sale price is bigger
-- 19856686:they are the same
-- 32267023:The original price is bigger

SELECT count(*) as interies,
CASE
    WHEN trnsact.orgprice > trnsact.sprice THEN 'The original price is bigger'
    WHEN trnsact.orgprice = trnsact.sprice THEN 'they are the same'
    ELSE 'The sale price is bigger'
END AS price_difference   

FROM trnsact
    LEFT JOIN skstinfo ON trnsact.store = skstinfo.store
    AND trnsact.sku = skstinfo.sku
WHERE skstinfo.sku IS NULL
GROUP BY price_difference