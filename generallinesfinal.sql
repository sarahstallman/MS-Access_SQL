SELECT DISTINCT CONSULTANTS.Date, CONSULTANTS.Type, CONSULTANTS.Category, CONSULTANTS.[general rollup] AS Rollup, Nz(IIF(sums.TotalSum IS NULL, CONSULTANTS.[general lines], sums.TotalSum), 0) AS TOTAL INTO [General Lines]
FROM CONSULTANTS LEFT JOIN (SELECT [general rollup], Date, SUM([general lines]) AS TotalSum FROM CONSULTANTS GROUP BY [general rollup], Date HAVING COUNT(*) > 1)  AS sums ON (CONSULTANTS.Date = sums.Date) AND (CONSULTANTS.[general rollup] = sums.[general rollup])
WHERE CONSULTANTS.[general rollup] IS NOT NULL;

#This SQL code creates a new table called "[General Lines]" by combining data from the "CONSULTANTS" table. It selects distinct dates, types, categories, and "[general rollup]" values from the "CONSULTANTS" table. Additionally, it calculates a new column named "TOTAL" by performing a conditional calculation using the "Nz" and "IIF" functions.

#The LEFT JOIN operation is used to combine data from the "CONSULTANTS" table with a subquery. The subquery calculates the sum of "[general lines]" values for each unique combination of "[general rollup]" and date where there are multiple occurrences (COUNT(*) > 1). This sum is labeled as "TotalSum" and is used in the calculation in the main query.

#The "Nz" function is used to handle cases where "TotalSum" is null. If "TotalSum" is null, the "IIF" function substitutes it with the "[general lines]" value from the "CONSULTANTS" table. If "TotalSum" is still null after the "IIF" substitution, it is set to 0.

#The result only includes records where the "[general rollup]" column in the "CONSULTANTS" table is not null, effectively filtering out any records with null "[general rollup]" values. The final result is then inserted into the "[General Lines]" table.
