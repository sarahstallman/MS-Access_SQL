SELECT [fac p&l].source, [fac p&l].date, [fac p&l].total, [rollup master list].[pension rollup], [rollup master list].division, [rollup master list].type, [rollup master list].category 
INTO FAC
FROM [fac p&l] LEFT JOIN [rollup master list] ON [fac p&l].source = [rollup master list].source
WHERE [rollup master list].company = 'fac';
