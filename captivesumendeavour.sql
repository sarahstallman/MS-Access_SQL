SELECT DISTINCT ENDEAVOUR.Date, ENDEAVOUR.Type, ENDEAVOUR.Category, ENDEAVOUR.[captive rollup], Nz(IIF(sums.TotalSum IS NULL, ENDEAVOUR.captive, sums.TotalSum), 0) AS TotalSum 
INTO ENDEAVOURCAPTIVE
FROM ENDEAVOUR LEFT JOIN (SELECT [captive rollup], Date, SUM(captive) AS TotalSum FROM ENDEAVOUR GROUP BY [captive rollup], Date HAVING COUNT(*) > 1)  AS sums ON (ENDEAVOUR.[captive rollup] = sums.[captive rollup]) AND (ENDEAVOUR.Date = sums.Date)
WHERE ENDEAVOUR.[captive rollup] IS NOT NULL;

#This SQL code creates a new table called "ENDEAVOURCAPTIVE" by combining data from the "ENDEAVOUR" table. It selects distinct dates, types, categories, and "captive rollup" values from the "ENDEAVOUR" table. Additionally, it calculates a new column named "TotalSum" by performing a conditional calculation using the "Nz" and "IIF" functions.

#The LEFT JOIN operation is used to combine data from the "ENDEAVOUR" table with a subquery. The subquery calculates the sum of "captive" values for each unique combination of "captive rollup" and date where there are multiple occurrences (COUNT(*) > 1). This sum is labeled as "TotalSum" and is used in the calculation in the main query.

#The "Nz" function is used to handle cases where "TotalSum" is null. If "TotalSum" is null, the "IIF" function substitutes it with the "captive" value from the "ENDEAVOUR" table. If "TotalSum" is still null after the "IIF" substitution, it is set to 0.

#The result only includes records where the "captive rollup" column in the "ENDEAVOUR" table is not null, effectively filtering out any records with null "captive rollup" values. The final result is then inserted into the "ENDEAVOURCAPTIVE" table.
