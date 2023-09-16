SELECT [cja p&l].source, [cja p&l].date, [cja p&l].corporate, [cja p&l].[life/retirement division], [cja p&l].health, [cja p&l].total, [rollup master list].[pension rollup], [rollup master list].[health rollup], [rollup master list].division, [rollup master list].type, [rollup master list].category 
INTO CJA
FROM [cja p&l] LEFT JOIN [rollup master list] ON [cja p&l].source = [rollup master list].source
WHERE [rollup master list].company = 'cja';
