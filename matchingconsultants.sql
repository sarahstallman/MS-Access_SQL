SELECT [consultants p&l].source, [consultants p&l].date, [consultants p&l].captive, [consultants p&l].[pension/life], [consultants p&l].health, [consultants p&l].[general lines], [rollup master list].[captive rollup], [rollup master list].[pension rollup], [rollup master list].[health rollup], [rollup master list].[general rollup], [rollup master list].division, [rollup master list].type, [rollup master list].category 
INTO CONSULTANTS
FROM [consultants p&l] LEFT JOIN [rollup master list] ON [consultants p&l].source = [rollup master list].source
WHERE [rollup master list].company = 'consultants';

#This SQL code selects specific columns from two tables, "[consultants p&l]" and "[rollup master list]," and performs a LEFT JOIN on the "source" column between them. It creates a new table called "CONSULTANTS."

#The columns selected include "source," "date," "captive," "[pension/life]," "health," and "[general lines]" from the "[consultants p&l]" table. Additionally, it selects "[captive rollup]," "[pension rollup]," "[health rollup]," "[general rollup]," "division," "type," and "category" from the "[rollup master list]" table.

#The LEFT JOIN operation combines the data from both tables based on matching "source" values. It retrieves rows from the "[consultants p&l]" table even if there is no corresponding "source" in the "[rollup master list]" table.

#The result includes records where the "company" column in the "[rollup master list]" table has the value 'consultants.' The data from both tables are then inserted into the new "CONSULTANTS" table.
