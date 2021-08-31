
-- Exercise 1: Use HELP and SHOW to confirm the relational schema provided to us for the
-- Dillard’s dataset shows the correct column names and primary keys for each table.
    --a
    SHOW TABLE strinfo;
    SHOW TABLE skstinfo;
    SHOW TABLE skuinfo;
    SHOW TABLE store_msa;
    SHOW TABLE trnsact;
    SHOW TABLE deptinfo;
    
    --b
    HELP TABLE strinfo;
    HELP TABLE skstinfo;
    HELP TABLE skuinfo;
    HELP TABLE store_msa;
    HELP TABLE trnsact;
    HELP TABLE deptinfo;


-- Exercise 2: Look at examples of data from each of the tables. Pay particular attention to
-- the skuinfo table.
    
    SELECT *
    FROM strinfo
    SAMPLE 50;
    
    SELECT *
    FROM skstinfo
    SAMPLE 50;
    
    SELECT *
    FROM skuinfo
    SAMPLE 50;
    
    SELECT *
    FROM store_msa
    SAMPLE 50;
    
    SELECT *
    FROM trnsact
    SAMPLE 50;
    
    SELECT *
    FROM deptinfo
    SAMPLE 50;

-- Exercise 3:

-- Exercise 4:
    SELECT *
    FROM trnsact
    WHERE amt <> sprice;
----
    SELECT amt, sprice, quantity
    FROM trnsact
    WHERE amt = sprice * quantity;
-- 
    SELECT amt, sprice, quantity
    FROM trnsact
    WHERE quantity <> 1;

-- Exercise 5:
    --a
    SELECT *
    FROM trnsact
    WHERE orgprice =0;
    -- b
    SELECT *
    FROM skstinfo
    WHERE cost = 0 AND  retail=0;
    -- c
    SELECT *
    FROM skstinfo
    WHERE cost > retail

-- Exercise 6:
    SELECT *
    FROM strinfo
    WHERE state IN ('CA', 'NY');
    
    SELECT TOP 10 *
    FROM skstinfo
    ORDER BY cost DESC;
    
    SELECT *
    FROM skstinfo
    WHERE cost BETWEEN 500 AND 1000;

    SELECT TOP 20 *
    FROM trnsact
    ORDER BY saledate DESC;

    SELECT TOP 40 EXTRACT(YEAR FROM saledate)
    FROM trnsact
    ORDER BY saledate DESC;
    
    SELECT *
    FROM trnsact
    WHERE EXTRACT(MONTH FROM saledate) BETWEEN 6 AND 8; -- Summer sales


-- Quiz 1:
    --6
    -- In how many columns of the STRINFO table of the Dillard’s database are NULL values *present*?
        SELECT *
        FROM strinfo
        WHERE city IS NULL;
        SELECT *
        FROM strinfo
        WHERE state IS NULL;
        SELECT *
        FROM strinfo
        WHERE zip IS NULL;

    --7
    --  What was the highest original price in the Dillard’s database of the item with SKU 3631365?
    SELECT TOP 10 *
    FROM trnsact
    WHERE sku=3631365
    ORDER BY orgprice DESC

    -- 8
    --  What is the color of the Liz Claiborne brand item with the highest SKU # 
    -- in the Dillard’s database (the Liz Claiborne brand is abbreviated “LIZ CLAI” in the Dillard’s database)?
    SELECT TOP 10 *
    FROM skuinfo
    WHERE brand LIKE ('%LIZ CLAI%')
    ORDER BY sku DESC

    --10 
    -- What is the sku number of the item in the Dillard’s database that had the highest original sales price? 
    SELECT TOP 10 *
    FROM trnsact
    ORDER BY orgprice DESC

    --11
    -- According to the strinfo table, in how many states within the United States are Dillard’s stores located?
    SELECT DISTINCT state
    FROM strinfo

    --12
    -- How many Dillard’s departments start with the letter “e”
    SELECT *
    FROM deptinfo
    WHERE deptdesc LIKE ('e%')

    --13 
    -- What was the date of the earliest sale in the database where the sale price of the item did not equal the original price of the item,
    --  and what was the largest margin (original price minus sale price) of an item sold on that earliest date? 04/08/01
    SELECT TOP 10 *
    FROM trnsact
    WHERE sprice <> orgprice
    ORDER BY saledate asc;

    SELECT orgprice,sprice, (orgprice-sprice) AS margin
    FROM trnsact
    WHERE saledate='2004-08-01'
    ORDER BY margin DESC 

-- 14.
-- What register number recorded the transaction with the highest original price and highest sale price between the dates of 
-- August 1, 2004 and August 10, 2004?  Make sure to sort by original price first and sale price second.
    SELECT top 10 *
    FROM trnsact
    WHERE saledate BETWEEN '2004-08-01' AND '2004-08-10'
    ORDER BY orgprice DESC, sprice DESC

-- 15.
-- Which of the following brand names with the word/letters “liz” in them exist in the Dillard’s database? 
--  Select all that apply. Note that you will need more than a single correct selection to answer the question correctly.
    SELECT DISTINCT brand
    FROM skuinfo
    WHERE brand LIKE ('%LIZ%')

-- 16.
-- What is the lowest store number of all the stores in the STORE_MSA table that are in the city of “little rock”,”memphis”, or “tulsa”?    
    SELECT TOP 10*
    FROM store_msa
    WHERE city IN ('little rock','memphis','memphis')
    ORDER BY store ASC