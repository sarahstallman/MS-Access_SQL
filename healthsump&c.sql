SELECT DISTINCT [P&C].Date, [P&C].Type, [P&C].Category, [P&C].[health rollup], Nz(IIF(sums.TotalSum IS NULL, [P&C].Health, sums.TotalSum), 0) AS TotalSum 
INTO [P&CHEALTH]
FROM [P&C] LEFT JOIN (SELECT [health rollup], Date, SUM(health) AS TotalSum FROM [P&C] GROUP BY [health rollup], Date HAVING COUNT(*) > 1)  AS sums ON ([P&C].[health rollup] = sums.[health rollup]) AND ([P&C].Date = sums.Date)
WHERE [P&C].[health rollup] IS NOT NULL;
