-- Set the DataBase to ua_dillards;
DATABASE ua_dillards;
-- Exercise 2: 
-- (b) Which stores are common to all four tables? 327 stores
SELECT store
FROM ua_dillards.strinfo
INTERSECT
SELECT store
FROM ua_dillards.trnsact
INTERSECT
SELECT store
FROM ua_dillards.skstinfo
INTERSECT
SELECT store
FROM ua_dillards.store_msa;
-- or unique to specific tables? --91
--Unique to strinfo
SELECT strinfo.store AS srtinfo_u
FROM strinfo
    LEFT JOIN store_msa ON store_msa.store = strinfo.store
    LEFT JOIN skstinfo ON skstinfo.store = strinfo.store
    LEFT JOIN trnsact ON trnsact.store = strinfo.store
WHERE trnsact.store IS NULL
    AND skstinfo.store IS NULL
    AND store_msa.store IS NULL;
--Unique to store_msa
SELECT store_msa.store AS store_msa_u
FROM store_msa
    LEFT JOIN strinfo ON strinfo.store = store_msa.store
    LEFT JOIN skstinfo ON skstinfo.store = store_msa.store
    LEFT JOIN trnsact ON trnsact.store = store_msa.store
WHERE trnsact.store IS NULL
    AND skstinfo.store IS NULL
    AND strinfo.store IS NULL;
--Unique to skstinfo -no data
SELECT skstinfo.store AS skstinfo_u
FROM skstinfo
    LEFT JOIN strinfo ON strinfo.store = skstinfo.store
    LEFT JOIN store_msa ON store_msa.store = skstinfo.store
    LEFT JOIN trnsact ON trnsact.store = skstinfo.store
    AND trnsact.sku = skstinfo.sku
WHERE trnsact.store IS NULL
    AND store_msa.store IS NULL
    AND strinfo.store IS NULL;
--Unique to trnsact -no data
SELECT trnsact.store AS skstinfo_u
FROM trnsact
    LEFT JOIN strinfo ON strinfo.store = trnsact.store
    LEFT JOIN store_msa ON store_msa.store = trnsact.store
    LEFT JOIN skstinfo ON skstinfo.store = trnsact.store
    AND trnsact.sku = skstinfo.sku
WHERE trnsact.store IS NULL
    AND store_msa.store IS NULL
    AND strinfo.store IS NULL;