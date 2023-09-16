SELECT [endeavour p&l].source, [endeavour p&l].date, [endeavour p&l].captive, [rollup master list].[captive rollup], [rollup master list].division, [rollup master list].type, [rollup master list].category 
INTO ENDEAVOUR
FROM [endeavour p&l] LEFT JOIN [rollup master list] ON [endeavour p&l].source = [rollup master list].source
WHERE [rollup master list].company = 'endeavour';

#This SQL code selects specific columns from two tables, "[endeavour p&l]" and "[rollup master list]," and performs a LEFT JOIN on the "source" column between them. It creates a new table called "ENDEAVOUR."

#The columns selected include "source," "date," "captive," "[captive rollup]," "division," "type," and "category."

#The LEFT JOIN operation combines the data from both tables based on matching "source" values. It retrieves rows from the "[endeavour p&l]" table even if there is no corresponding "source" in the "[rollup master list]" table.

#The result includes records where the "company" column in the "[rollup master list]" table has the value 'endeavour.' The data from both tables are then inserted into the new "ENDEAVOUR" table.
