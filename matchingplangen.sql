SELECT [plangen p&l].source, [plangen p&l].date, [plangen p&l].total, [rollup master list].[pension rollup], [rollup master list].division, [rollup master list].type, [rollup master list].category 
INTO PLANGEN
FROM [plangen p&l] LEFT JOIN [rollup master list] ON [plangen p&l].source = [rollup master list].source
WHERE [rollup master list].company = 'plangen';
