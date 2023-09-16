SELECT [endeavour p&l].source, [endeavour p&l].date, [endeavour p&l].captive, [rollup master list].[captive rollup], [rollup master list].division, [rollup master list].type, [rollup master list].category 
INTO ENDEAVOUR
FROM [endeavour p&l] LEFT JOIN [rollup master list] ON [endeavour p&l].source = [rollup master list].source
WHERE [rollup master list].company = 'endeavour';
