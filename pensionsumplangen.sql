SELECT DISTINCT PLANGEN.Date, PLANGEN.Type, PLANGEN.Category, PLANGEN.[pension rollup], Nz(IIF(sums.TotalSum IS NULL, PLANGEN.Total, sums.TotalSum), 0) AS TotalSum 
INTO PLANGENPENSION
FROM PLANGEN LEFT JOIN (SELECT [pension rollup], Date, SUM(Total) AS TotalSum FROM PLANGEN GROUP BY [pension rollup], Date HAVING COUNT(*) > 1)  AS sums ON (PLANGEN.Date = sums.Date) AND (PLANGEN.[pension rollup] = sums.[pension rollup])
WHERE PLANGEN.[pension rollup] IS NOT NULL;
