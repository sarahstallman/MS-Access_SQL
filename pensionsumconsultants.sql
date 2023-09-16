SELECT DISTINCT CONSULTANTS.Date, CONSULTANTS.Type, CONSULTANTS.Category, CONSULTANTS.[pension rollup], Nz(IIF(sums.TotalSum IS NULL, CONSULTANTS.[pension/life], sums.TotalSum), 0) AS TotalSum 
INTO CONSULTANTSPENSION
FROM CONSULTANTS LEFT JOIN (SELECT [pension rollup], Date, SUM([pension/life]) AS TotalSum FROM CONSULTANTS GROUP BY [pension rollup], Date HAVING COUNT(*) > 1)  AS sums ON (CONSULTANTS.Date = sums.Date) AND (CONSULTANTS.[pension rollup] = sums.[pension rollup])
WHERE CONSULTANTS.[pension rollup] IS NOT NULL;

#This SQL code creates a new table called "CONSULTANTSPENSION" by combining data from the "CONSULTANTS" table. It selects distinct dates, types, categories, and "[pension rollup]" values from the "CONSULTANTS" table. Additionally, it calculates a new column named "TotalSum" by performing a conditional calculation using the "Nz" and "IIF" functions.

#The LEFT JOIN operation is used to combine data from the "CONSULTANTS" table with a subquery. The subquery calculates the sum of "[pension/life]" values for each unique combination of "[pension rollup]" and date where there are multiple occurrences (COUNT(*) > 1). This sum is labeled as "TotalSum" and is used in the calculation in the main query.

#The "Nz" function is used to handle cases where "TotalSum" is null. If "TotalSum" is null, the "IIF" function substitutes it with the "[pension/life]" value from the "CONSULTANTS" table. If "TotalSum" is still null after the "IIF" substitution, it is set to 0.

#The result only includes records where the "[pension rollup]" column in the "CONSULTANTS" table is not null, effectively filtering out any records with null "[pension rollup]" values. The final result is then inserted into the "CONSULTANTSPENSION" table.
