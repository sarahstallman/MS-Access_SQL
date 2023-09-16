SELECT DISTINCT CONSULTANTS.Date, CONSULTANTS.Type, CONSULTANTS.Category, CONSULTANTS.[general rollup] AS Rollup, Nz(IIF(sums.TotalSum IS NULL, CONSULTANTS.[general lines], sums.TotalSum), 0) AS TOTAL INTO [General Lines]
FROM CONSULTANTS LEFT JOIN (SELECT [general rollup], Date, SUM([general lines]) AS TotalSum FROM CONSULTANTS GROUP BY [general rollup], Date HAVING COUNT(*) > 1)  AS sums ON (CONSULTANTS.Date = sums.Date) AND (CONSULTANTS.[general rollup] = sums.[general rollup])
WHERE CONSULTANTS.[general rollup] IS NOT NULL;
