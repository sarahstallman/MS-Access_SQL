SELECT [p&c p&l].source, [p&c p&l].date, [p&c p&l].captive, [p&c p&l].health, [rollup master list].[captive rollup], [rollup master list].[health rollup], [rollup master list].division, [rollup master list].type, [rollup master list].category 
INTO [P&C]
FROM [p&c p&l] LEFT JOIN [rollup master list] ON [p&c p&l].source = [rollup master list].source
WHERE [rollup master list].company = 'p&c';
