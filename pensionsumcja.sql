SELECT DISTINCT CJAFIXED.Date, CJAFIXED.Type, CJAFIXED.Category, CJAFIXED.[pension rollup], Nz(IIF(sums.TotalSum IS NULL, CJAFIXED.NewTotals, sums.TotalSum), 0) AS TotalSum 
INTO CJAPENSION
FROM CJAFIXED LEFT JOIN (SELECT [pension rollup], Date, SUM(NewTotals) AS TotalSum FROM CJAFIXED GROUP BY [pension rollup], Date HAVING COUNT(*) > 1)  AS sums ON (CJAFIXED.Date = sums.Date) AND (CJAFIXED.[pension rollup] = sums.[pension rollup])
WHERE CJAFIXED.[pension rollup] IS NOT NULL;
