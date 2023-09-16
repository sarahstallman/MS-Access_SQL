SELECT DISTINCT CJAFIXED.Date, CJAFIXED.Type, CJAFIXED.Category, CJAFIXED.[pension rollup], Nz(IIF(sums.TotalSum IS NULL, CJAFIXED.NewTotals, sums.TotalSum), 0) AS TotalSum 
INTO CJAPENSION
FROM CJAFIXED LEFT JOIN (SELECT [pension rollup], Date, SUM(NewTotals) AS TotalSum FROM CJAFIXED GROUP BY [pension rollup], Date HAVING COUNT(*) > 1)  AS sums ON (CJAFIXED.Date = sums.Date) AND (CJAFIXED.[pension rollup] = sums.[pension rollup])
WHERE CJAFIXED.[pension rollup] IS NOT NULL;

#This SQL code creates a new table called "CJAPENSION" by combining data from the "CJAFIXED" table. It selects distinct dates, types, categories, and "[pension rollup]" values from the "CJAFIXED" table. Additionally, it calculates a new column named "TotalSum" by performing a conditional calculation using the "Nz" and "IIF" functions.

#The LEFT JOIN operation is used to combine data from the "CJAFIXED" table with a subquery. The subquery calculates the sum of "NewTotals" values for each unique combination of "[pension rollup]" and date where there are multiple occurrences (COUNT(*) > 1). This sum is labeled as "TotalSum" and is used in the calculation in the main query.

#The "Nz" function is used to handle cases where "TotalSum" is null. If "TotalSum" is null, the "IIF" function substitutes it with the "NewTotals" value from the "CJAFIXED" table. If "TotalSum" is still null after the "IIF" substitution, it is set to 0.

#The result only includes records where the "[pension rollup]" column in the "CJAFIXED" table is not null, effectively filtering out any records with null "[pension rollup]" values. The final result is then inserted into the "CJAPENSION" table.
