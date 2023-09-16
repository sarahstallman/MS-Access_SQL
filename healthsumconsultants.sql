SELECT DISTINCT CONSULTANTS.Date, CONSULTANTS.Type, CONSULTANTS.Category, CONSULTANTS.[health rollup], Nz(IIF(sums.TotalSum IS NULL, CONSULTANTS.Health, sums.TotalSum), 0) AS TotalSum 
INTO CONSULTANTSHEALTH
FROM CONSULTANTS LEFT JOIN (SELECT [health rollup], Date, SUM(health) AS TotalSum FROM CONSULTANTS GROUP BY [health rollup], Date HAVING COUNT(*) > 1)  AS sums ON (CONSULTANTS.[health rollup] = sums.[health rollup]) AND (CONSULTANTS.Date = sums.Date)
WHERE CONSULTANTS.[health rollup] IS NOT NULL;
