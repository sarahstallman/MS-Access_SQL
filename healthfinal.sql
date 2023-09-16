SELECT CombinedTables.Type, CombinedTables.Category, CombinedTables.[health rollup] AS Rollup, CombinedTables.[Date], Sum(Nz(PC_SUM,0)) AS [P&C], Sum(Nz(CJA_SUM,0)) AS CJA, Sum(Nz(Consultants_SUM,0)) AS Consultants, Sum(Nz(PC_SUM,0))+Sum(Nz(CJA_SUM,0))+Sum(Nz(Consultants_SUM,0)) AS TOTAL INTO [Health Division]
FROM (SELECT 
            Type,
            Category,
            [health rollup],
            [Date],
            TotalSum AS PC_SUM,
            0 AS CJA_SUM,
            0 AS Consultants_SUM
        FROM [P&CHEALTH]
        
        UNION ALL
        
        SELECT 
            Type,
            Category,
            [health rollup],
            [Date],
            0 AS PC_SUM,
            TotalSum AS CJA_SUM,
            0 AS Consultants_SUM
        FROM CJAHEALTH

        UNION ALL

        SELECT 
            Type,
            Category,
            [health rollup],
            [Date],
            0 AS PC_SUM,
            0 AS CJA_SUM,
            TotalSum AS Consultants_SUM
        FROM CONSULTANTSHEALTH
    )  AS CombinedTables
GROUP BY CombinedTables.Type, CombinedTables.Category, CombinedTables.[health rollup], CombinedTables.[Date];

#This SQL code creates a new table called "[Health Division]" by combining data from three different tables: "[P&CHEALTH]," "CJAHEALTH," and "CONSULTANTSHEALTH." The code performs three separate SELECT queries using UNION ALL to combine data from each source table.

#Each SELECT query within the UNION ALL includes columns for "Type," "Category," "[health rollup]," and "[Date]," along with columns for summing values from each source table, named "PC_SUM," "CJA_SUM," and "Consultants_SUM."

#The main query then groups the data from the UNION ALL results based on "Type," "Category," "[health rollup]," and "[Date]." It calculates the sum of "PC_SUM," "CJA_SUM," and "Consultants_SUM" for each group using the SUM function.

#The result is a new table "[Health Division]" containing grouped data from the three source tables, where each row represents a unique combination of "Type," "Category," "[health rollup]," and "[Date]," along with the corresponding sums from each source table. The calculated total sum of "PC_SUM," "CJA_SUM," and "Consultants_SUM" for each group is also included in the new table.

