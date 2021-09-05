-- Set the DataBase to ua_dillards;
DATABASE ua_dillards;
-- Exercise 7:
--  How many departments have more than 100 brands associated with them,
--  and what are their descriptions?
SELECT count (DISTINCT skuinfo.brand) AS number_of_brands,
        deptinfo.dept,
        deptinfo.deptdesc
FROM skuinfo
JOIN deptinfo 
ON deptinfo.dept = skuinfo.dept
GROUP BY deptinfo.dept,deptinfo.deptdesc
HAVING number_of_brands >= 100;