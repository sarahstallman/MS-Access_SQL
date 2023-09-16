SELECT [fac p&l].source, [fac p&l].date, [fac p&l].total, [rollup master list].[pension rollup], [rollup master list].division, [rollup master list].type, [rollup master list].category 
INTO FAC
FROM [fac p&l] LEFT JOIN [rollup master list] ON [fac p&l].source = [rollup master list].source
WHERE [rollup master list].company = 'fac';

#The given SQL code performs a LEFT JOIN operation to merge data from the "[fac p&l]" table and the "[rollup master list]" table based on the "source" column. The SELECT clause specifies certain columns from both tables that will be included in the new table "FAC."

#The resulting "FAC" table will contain the selected columns from the two tables where there is a match on the "source" column. The LEFT JOIN ensures that all records from the "[fac p&l]" table are included in the result, even if there is no match in the "[rollup master list]" table.

#The query applies a filter using the WHERE clause, limiting the result to records where the value in the "company" column of the "[rollup master list]" table is 'fac'.

#In summary, the code creates a new table "FAC," combining relevant data from both tables while retaining all records from the "[fac p&l]" table and filtering based on the 'fac' value in the "company" column of the "[rollup master list]" table.
