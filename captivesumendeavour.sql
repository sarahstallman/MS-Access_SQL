SELECT DISTINCT ENDEAVOUR.Date, ENDEAVOUR.Type, ENDEAVOUR.Category, ENDEAVOUR.[captive rollup], Nz(IIF(sums.TotalSum IS NULL, ENDEAVOUR.captive, sums.TotalSum), 0) AS TotalSum 
INTO ENDEAVOURCAPTIVE
FROM ENDEAVOUR LEFT JOIN (SELECT [captive rollup], Date, SUM(captive) AS TotalSum FROM ENDEAVOUR GROUP BY [captive rollup], Date HAVING COUNT(*) > 1)  AS sums ON (ENDEAVOUR.[captive rollup] = sums.[captive rollup]) AND (ENDEAVOUR.Date = sums.Date)
WHERE ENDEAVOUR.[captive rollup] IS NOT NULL;
