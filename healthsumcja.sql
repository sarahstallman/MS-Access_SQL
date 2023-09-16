SELECT DISTINCT CJA.Date, CJA.Type, CJA.Category, CJA.[health rollup], Nz(IIF(sums.TotalSum IS NULL, CJA.Health, sums.TotalSum), 0) AS TotalSum 
INTO CJAHEALTH
FROM CJA LEFT JOIN (SELECT [health rollup], Date, SUM(health) AS TotalSum FROM CJA GROUP BY [health rollup], Date HAVING COUNT(*) > 1)  AS sums ON (CJA.[health rollup] = sums.[health rollup]) AND (CJA.Date = sums.Date)
WHERE CJA.[health rollup] IS NOT NULL;
