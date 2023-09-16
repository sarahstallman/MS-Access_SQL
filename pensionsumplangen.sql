SELECT DISTINCT PLANGEN.Date, PLANGEN.Type, PLANGEN.Category, PLANGEN.[pension rollup], Nz(IIF(sums.TotalSum IS NULL, PLANGEN.Total, sums.TotalSum), 0) AS TotalSum 
INTO PLANGENPENSION
FROM PLANGEN LEFT JOIN (SELECT [pension rollup], Date, SUM(Total) AS TotalSum FROM PLANGEN GROUP BY [pension rollup], Date HAVING COUNT(*) > 1)  AS sums ON (PLANGEN.Date = sums.Date) AND (PLANGEN.[pension rollup] = sums.[pension rollup])
WHERE PLANGEN.[pension rollup] IS NOT NULL;

#This SQL code creates a new table called "PLANGENPENSION" by combining data from the "PLANGEN" table. It selects distinct dates, types, categories, and "[pension rollup]" values from the "PLANGEN" table. Additionally, it calculates a new column named "TotalSum" by performing a conditional calculation using the "Nz" and "IIF" functions.

#The LEFT JOIN operation is used to combine data from the "PLANGEN" table with a subquery. The subquery calculates the sum of "Total" values for each unique combination of "[pension rollup]" and date where there are multiple occurrences (COUNT(*) > 1). This sum is labeled as "TotalSum" and is used in the calculation in the main query.

#The "Nz" function is used to handle cases where "TotalSum" is null. If "TotalSum" is null, the "IIF" function substitutes it with the "Total" value from the "PLANGEN" table. If "TotalSum" is still null after the "IIF" substitution, it is set to 0.

#The result only includes records where the "[pension rollup]" column in the "PLANGEN" table is not null, effectively filtering out any records with null "[pension rollup]" values. The final result is then inserted into the "PLANGENPENSION" table.
