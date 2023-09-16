SELECT DISTINCT [P&C].Date, [P&C].Type, [P&C].Category, [P&C].[health rollup], Nz(IIF(sums.TotalSum IS NULL, [P&C].Health, sums.TotalSum), 0) AS TotalSum 
INTO [P&CHEALTH]
FROM [P&C] LEFT JOIN (SELECT [health rollup], Date, SUM(health) AS TotalSum FROM [P&C] GROUP BY [health rollup], Date HAVING COUNT(*) > 1)  AS sums ON ([P&C].[health rollup] = sums.[health rollup]) AND ([P&C].Date = sums.Date)
WHERE [P&C].[health rollup] IS NOT NULL;

#This SQL code creates a new table called "[P&CHEALTH]" by combining data from the "[P&C]" table. It selects distinct dates, types, categories, and "[health rollup]" values from the "[P&C]" table. Additionally, it calculates a new column named "TotalSum" by performing a conditional calculation using the "Nz" and "IIF" functions.

#The LEFT JOIN operation is used to combine data from the "[P&C]" table with a subquery. The subquery calculates the sum of "health" values for each unique combination of "[health rollup]" and date where there are multiple occurrences (COUNT(*) > 1). This sum is labeled as "TotalSum" and is used in the calculation in the main query.

#The "Nz" function is used to handle cases where "TotalSum" is null. If "TotalSum" is null, the "IIF" function substitutes it with the "Health" value from the "[P&C]" table. If "TotalSum" is still null after the "IIF" substitution, it is set to 0.

#The result only includes records where the "[health rollup]" column in the "[P&C]" table is not null, effectively filtering out any records with null "[health rollup]" values. The final result is then inserted into the "[P&CHEALTH]" table.
