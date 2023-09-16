SELECT DISTINCT CONSULTANTS.Date, CONSULTANTS.Type, CONSULTANTS.Category, CONSULTANTS.[pension rollup], Nz(IIF(sums.TotalSum IS NULL, CONSULTANTS.[pension/life], sums.TotalSum), 0) AS TotalSum 
INTO CONSULTANTSPENSION
FROM CONSULTANTS LEFT JOIN (SELECT [pension rollup], Date, SUM([pension/life]) AS TotalSum FROM CONSULTANTS GROUP BY [pension rollup], Date HAVING COUNT(*) > 1)  AS sums ON (CONSULTANTS.Date = sums.Date) AND (CONSULTANTS.[pension rollup] = sums.[pension rollup])
WHERE CONSULTANTS.[pension rollup] IS NOT NULL;
