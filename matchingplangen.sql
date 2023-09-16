SELECT [plangen p&l].source, [plangen p&l].date, [plangen p&l].total, [rollup master list].[pension rollup], [rollup master list].division, [rollup master list].type, [rollup master list].category 
INTO PLANGEN
FROM [plangen p&l] LEFT JOIN [rollup master list] ON [plangen p&l].source = [rollup master list].source
WHERE [rollup master list].company = 'plangen';

#This SQL code creates a new table called "PLANGEN" by combining data from two tables, "[plangen p&l]" and "[rollup master list]," using a LEFT JOIN operation based on the "source" column. The SELECT clause specifies columns "source," "date," "total," "pension rollup," "division," "type," and "category" that will be included in the new table.

#The LEFT JOIN operation merges data from the "[plangen p&l]" table with the "[rollup master list]" table, ensuring that all records from the "[plangen p&l]" table are included in the result, even if there is no match in the "[rollup master list]" table.

#The WHERE clause filters the result to include only records where the "company" column in the "[rollup master list]" table is 'plangen,' which limits the data to only those related to the 'plangen' company. The selected columns from both tables are then inserted into the new "PLANGEN" table.
