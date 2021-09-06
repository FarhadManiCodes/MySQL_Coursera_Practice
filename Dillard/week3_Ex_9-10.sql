-- Set the DataBase to ua_dillards;
DATABASE ua_dillards;

-- Exercise 9: 
-- What department (with department description),brand, style, and color 
-- had the greatest total value of returned items?

SELECT  skuinfo.dept AS department,
        deptinfo.deptdesc AS description,
        skuinfo.brand AS brand,
        skuinfo.style AS style,
        skuinfo.color AS color,
        SUM(trnsact.sprice) as total_value

FROM skuinfo 

JOIN trnsact
ON skuinfo.sku = trnsact.sku

JOIN deptinfo ON 
skuinfo.dept = deptinfo.dept

WHERE trnsact.stype = 'R'
GROUP BY department,description,brand,style,color
ORDER BY total_value DESC;

-- Exercise 10: 
-- In what state and zip code is the store that had the greatest total 
-- revenue during the time period monitored in our dataset?

SELECT trnsact.store AS store,
    strinfo.city AS city,
    strinfo.state AS state,
    strinfo.zip AS zipcode,
    SUM(trnsact.amt) AS sum_revenue

FROM trnsact    
    
    INNER JOIN strinfo ON strinfo.store = trnsact.store


GROUP BY trnsact.store,city,state,zipcode

ORDER BY sum_revenue DESC;