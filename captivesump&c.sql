SELECT DISTINCT [P&C].Date, [P&C].Type, [P&C].Category, [P&C].[captive rollup], Nz(IIF(sums.TotalSum IS NULL, [P&C].captive, sums.TotalSum), 0) AS TotalSum 
INTO [P&CCAPTIVE]
FROM [P&C] LEFT JOIN (SELECT [captive rollup], Date, SUM(captive) AS TotalSum FROM [P&C] GROUP BY [captive rollup], Date HAVING COUNT(*) > 1)  AS sums ON ([P&C].[captive rollup] = sums.[captive rollup]) AND ([P&C].Date = sums.Date)
WHERE [P&C].[captive rollup] IS NOT NULL;

#This SQL code creates a new table called "[P&CCAPTIVE]" by combining data from the "[P&C]" table. It selects distinct dates, types, categories, and "captive rollup" values from the "[P&C]" table. Additionally, it calculates a new column named "TotalSum" by performing a conditional calculation using the "Nz" and "IIF" functions.

#The LEFT JOIN operation is used to combine data from the "[P&C]" table with a subquery. The subquery calculates the sum of "captive" values for each unique combination of "captive rollup" and date where there are multiple occurrences (COUNT(*) > 1). This sum is labeled as "TotalSum" and is used in the calculation in the main query.

#The "Nz" function is used to handle cases where "TotalSum" is null. If "TotalSum" is null, the "IIF" function substitutes it with the "captive" value from the "[P&C]" table. If "TotalSum" is still null after the "IIF" substitution, it is set to 0.

#The result only includes records where the "captive rollup" column in the "[P&C]" table is not null, effectively filtering out any records with null "captive rollup" values. The final result is then inserted into the "[P&CCAPTIVE]" table.
