SELECT DISTINCT CJA.Date, CJA.Type, CJA.Category, CJA.[health rollup], Nz(IIF(sums.TotalSum IS NULL, CJA.Health, sums.TotalSum), 0) AS TotalSum 
INTO CJAHEALTH
FROM CJA LEFT JOIN (SELECT [health rollup], Date, SUM(health) AS TotalSum FROM CJA GROUP BY [health rollup], Date HAVING COUNT(*) > 1)  AS sums ON (CJA.[health rollup] = sums.[health rollup]) AND (CJA.Date = sums.Date)
WHERE CJA.[health rollup] IS NOT NULL;

#This SQL code creates a new table called "CJAHEALTH" by combining data from the "CJA" table. It selects distinct dates, types, categories, and "[health rollup]" values from the "CJA" table. Additionally, it calculates a new column named "TotalSum" by performing a conditional calculation using the "Nz" and "IIF" functions.

#The LEFT JOIN operation is used to combine data from the "CJA" table with a subquery. The subquery calculates the sum of "health" values for each unique combination of "[health rollup]" and date where there are multiple occurrences (COUNT(*) > 1). This sum is labeled as "TotalSum" and is used in the calculation in the main query.

#The "Nz" function is used to handle cases where "TotalSum" is null. If "TotalSum" is null, the "IIF" function substitutes it with the "Health" value from the "CJA" table. If "TotalSum" is still null after the "IIF" substitution, it is set to 0.

#The result only includes records where the "[health rollup]" column in the "CJA" table is not null, effectively filtering out any records with null "[health rollup]" values. The final result is then inserted into the "CJAHEALTH" table.
