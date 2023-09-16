SELECT DISTINCT [P&C].Date, [P&C].Type, [P&C].Category, [P&C].[captive rollup], Nz(IIF(sums.TotalSum IS NULL, [P&C].captive, sums.TotalSum), 0) AS TotalSum 
INTO [P&CCAPTIVE]
FROM [P&C] LEFT JOIN (SELECT [captive rollup], Date, SUM(captive) AS TotalSum FROM [P&C] GROUP BY [captive rollup], Date HAVING COUNT(*) > 1)  AS sums ON ([P&C].[captive rollup] = sums.[captive rollup]) AND ([P&C].Date = sums.Date)
WHERE [P&C].[captive rollup] IS NOT NULL;
