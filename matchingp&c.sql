SELECT [p&c p&l].source, [p&c p&l].date, [p&c p&l].captive, [p&c p&l].health, [rollup master list].[captive rollup], [rollup master list].[health rollup], [rollup master list].division, [rollup master list].type, [rollup master list].category 
INTO [P&C]
FROM [p&c p&l] LEFT JOIN [rollup master list] ON [p&c p&l].source = [rollup master list].source
WHERE [rollup master list].company = 'p&c';

#This SQL code combines data from two tables, "[p&c p&l]" and "[rollup master list]," using a LEFT JOIN based on the "source" column. It selects specific columns from both tables and creates a new table called "[P&C]." The result includes records where the "company" column in the "[rollup master list]" table has the value 'p&c.'

#The SELECT clause specifies the columns "source," "date," "captive," and "health" from the "[p&c p&l]" table and the columns "captive rollup," "health rollup," "division," "type," and "category" from the "[rollup master list]" table that will be included in the new table "[P&C]."

#The LEFT JOIN operation merges the data from both tables based on the "source" column, ensuring that all records from the "[p&c p&l]" table are included in the result, even if there is no match in the "[rollup master list]" table.

#The WHERE clause filters the result to include only records where the "company" column in the "[rollup master list]" table is 'p&c.' This condition helps to restrict the data to only the relevant records related to the 'p&c' company.
