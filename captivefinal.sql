SELECT CombinedTables.Type, CombinedTables.Category, CombinedTables.[captive rollup] AS Rollup, CombinedTables.[Date], Sum(Nz(PC_SUM,0)) AS [P&C], Sum(Nz(Endeavour_SUM,0)) AS Endeavour, Sum(Nz(Consultants_SUM,0)) AS Consultants, Sum(Nz(PC_SUM,0))+Sum(Nz(Endeavour_SUM,0))+Sum(Nz(Consultants_SUM,0)) AS TOTAL INTO [Captive Division]
FROM (SELECT 
            Type,
            Category,
            [captive rollup],
            [Date],
            TotalSum AS PC_SUM,
            0 AS Endeavour_SUM,
            0 AS Consultants_SUM
        FROM [P&CCAPTIVE]
        
        UNION ALL
        
        SELECT 
            Type,
            Category,
            [captive rollup],
            [Date],
            0 AS PC_SUM,
            TotalSum AS Endeavour_SUM,
            0 AS Consultants_SUM
        FROM ENDEAVOURCAPTIVE

        UNION ALL

        SELECT 
            Type,
            Category,
            [captive rollup],
            [Date],
            0 AS PC_SUM,
            0 AS Endeavour_SUM,
            TotalSum AS Consultants_SUM
        FROM CONSULTANTSCAPTIVE
    )  AS CombinedTables
GROUP BY CombinedTables.Type, CombinedTables.Category, CombinedTables.[captive rollup], CombinedTables.[Date];

#This SQL code combines data from three different tables: "[P&CCAPTIVE]," "ENDEAVOURCAPTIVE," and "CONSULTANTSCAPTIVE" into a new table called "[Captive Division]." The code performs three separate SELECT queries using UNION ALL to combine data from each source table.

#Each SELECT query within the UNION ALL includes columns for "Type," "Category," "[captive rollup]," and "[Date]," along with columns for summing values from each source table, named "PC_SUM," "Endeavour_SUM," and "Consultants_SUM."

#The main query then groups the data from the UNION ALL results based on "Type," "Category," "[captive rollup]," and "[Date]." It calculates the sum of "PC_SUM," "Endeavour_SUM," and "Consultants_SUM" for each group using the SUM function.

#The result is a new table "[Captive Division]" containing grouped data from the three source tables, where each row represents a unique combination of "Type," "Category," "[captive rollup]," and "[Date]," along with the corresponding sums from each source table.

