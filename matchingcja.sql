SELECT [cja p&l].source, [cja p&l].date, [cja p&l].corporate, [cja p&l].[life/retirement division], [cja p&l].health, [cja p&l].total, [rollup master list].[pension rollup], [rollup master list].[health rollup], [rollup master list].division, [rollup master list].type, [rollup master list].category 
INTO CJA
FROM [cja p&l] LEFT JOIN [rollup master list] ON [cja p&l].source = [rollup master list].source
WHERE [rollup master list].company = 'cja';

#This SQL code selects specific columns from two tables, "[cja p&l]" and "[rollup master list]," and performs a LEFT JOIN on the "source" column between them. It creates a new table called "CJA."

#The columns selected include "source," "date," "corporate," "[life/retirement division]," "health," and "total" from the "[cja p&l]" table. Additionally, it selects "[pension rollup]," "[health rollup]," "division," "type," and "category" from the "[rollup master list]" table.

#The LEFT JOIN operation combines the data from both tables based on matching "source" values. It retrieves rows from the "[cja p&l]" table even if there is no corresponding "source" in the "[rollup master list]" table.

#The result includes records where the "company" column in the "[rollup master list]" table has the value 'cja.' The data from both tables are then inserted into the new "CJA" table.

