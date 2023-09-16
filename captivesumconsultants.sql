SELECT DISTINCT CONSULTANTS.Date, CONSULTANTS.Type, CONSULTANTS.Category, CONSULTANTS.[captive rollup], Nz(IIF(sums.TotalSum IS NULL, CONSULTANTS.captive, sums.TotalSum), 0) AS TotalSum 
INTO CONSULTANTSCAPTIVE
FROM CONSULTANTS LEFT JOIN (SELECT [captive rollup], Date, SUM(captive) AS TotalSum FROM CONSULTANTS GROUP BY [captive rollup], Date HAVING COUNT(*) > 1)  AS sums ON (CONSULTANTS.[captive rollup] = sums.[captive rollup]) AND (CONSULTANTS.Date = sums.Date)
WHERE CONSULTANTS.[captive rollup] IS NOT NULL;
