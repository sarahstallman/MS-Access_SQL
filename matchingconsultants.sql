SELECT [consultants p&l].source, [consultants p&l].date, [consultants p&l].captive, [consultants p&l].[pension/life], [consultants p&l].health, [consultants p&l].[general lines], [rollup master list].[captive rollup], [rollup master list].[pension rollup], [rollup master list].[health rollup], [rollup master list].[general rollup], [rollup master list].division, [rollup master list].type, [rollup master list].category 
INTO CONSULTANTS
FROM [consultants p&l] LEFT JOIN [rollup master list] ON [consultants p&l].source = [rollup master list].source
WHERE [rollup master list].company = 'consultants';
