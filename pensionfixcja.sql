SELECT Type, Category, Division, Date, [health rollup], [pension Rollup], Health, IIF(Corporate IS NULL AND Health IS NULL, Total, IIF(Corporate IS NOT NULL OR Health IS NOT NULL, [Life/Retirement Division], 0)) AS NewTotals INTO CJAFIXED
FROM CJA;
