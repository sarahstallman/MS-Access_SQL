SELECT DISTINCT FAC.Date, FAC.Type, FAC.Category, FAC.[pension rollup], Nz(IIF(sums.TotalSum IS NULL, FAC.Total, sums.TotalSum), 0) AS TotalSum 
INTO FACPENSION
FROM FAC LEFT JOIN (SELECT [pension rollup], Date, SUM(Total) AS TotalSum FROM FAC GROUP BY [pension rollup], Date HAVING COUNT(*) > 1)  AS sums ON (FAC.Date = sums.Date) AND (FAC.[pension rollup] = sums.[pension rollup])
WHERE FAC.[pension rollup] IS NOT NULL;

#This SQL code creates a new table called "FACPENSION" by combining data from the "FAC" table. It selects distinct dates, types, categories, and "[pension rollup]" values from the "FAC" table. Additionally, it calculates a new column named "TotalSum" by performing a conditional calculation using the "Nz" and "IIF" functions.

#The LEFT JOIN operation is used to combine data from the "FAC" table with a subquery. The subquery calculates the sum of "Total" values for each unique combination of "[pension rollup]" and date where there are multiple occurrences (COUNT(*) > 1). This sum is labeled as "TotalSum" and is used in the calculation in the main query.

#The "Nz" function is used to handle cases where "TotalSum" is null. If "TotalSum" is null, the "IIF" function substitutes it with the "Total" value from the "FAC" table. If "TotalSum" is still null after the "IIF" substitution, it is set to 0.

#The result only includes records where the "[pension rollup]" column in the "FAC" table is not null, effectively filtering out any records with null "[pension rollup]" values. The final result is then inserted into the "FACPENSION" table.
