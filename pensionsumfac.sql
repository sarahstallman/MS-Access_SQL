SELECT DISTINCT FAC.Date, FAC.Type, FAC.Category, FAC.[pension rollup], Nz(IIF(sums.TotalSum IS NULL, FAC.Total, sums.TotalSum), 0) AS TotalSum 
INTO FACPENSION
FROM FAC LEFT JOIN (SELECT [pension rollup], Date, SUM(Total) AS TotalSum FROM FAC GROUP BY [pension rollup], Date HAVING COUNT(*) > 1)  AS sums ON (FAC.Date = sums.Date) AND (FAC.[pension rollup] = sums.[pension rollup])
WHERE FAC.[pension rollup] IS NOT NULL;
