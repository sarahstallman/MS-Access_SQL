SELECT 
    CombinedTables.Type, 
    CombinedTables.Category, 
    CombinedTables.[pension rollup] AS Rollup, 
    CombinedTables.[Date], 
    Sum(Nz(FAC_SUM,0)) AS FAC, 
    Sum(Nz(Plangen_SUM,0)) AS Plangen, 
    Sum(Nz(CJA_SUM,0)) AS CJA, 
    Sum(Nz(Consultants_SUM,0)) AS Consultants, 
    Sum(Nz(FAC_SUM,0)) + Sum(Nz(Plangen_SUM,0)) + Sum(Nz(CJA_SUM,0)) + Sum(Nz(Consultants_SUM,0)) AS TOTAL 
INTO [Pension Division]
FROM (
    SELECT 
        Type,
        Category,
        [pension rollup],
        [Date],
        TotalSum AS FAC_SUM,
        0 AS Plangen_SUM,
        0 AS CJA_SUM,
        0 AS Consultants_SUM
    FROM FACPENSION

    UNION ALL

    SELECT 
        Type,
        Category,
        [pension rollup],
        [Date],
        0 AS FAC_SUM,
        TotalSum AS Plangen_SUM,
        0 AS CJA_SUM,
        0 AS Consultants_SUM
    FROM PLANGENPENSION

    UNION ALL

    SELECT 
        Type,
        Category,
        [pension rollup],
        [Date],
        0 AS FAC_SUM,
        0 AS Plangen_SUM,
        TotalSum AS CJA_SUM,
        0 AS Consultants_SUM
    FROM CJAPENSION

    UNION ALL

    SELECT 
        Type,
        Category,
        [pension rollup],
        [Date],
        0 AS FAC_SUM,
        0 AS Plangen_SUM,
        0 AS CJA_SUM,
        TotalSum AS Consultants_SUM
    FROM CONSULTANTSPENSION
)  AS CombinedTables
GROUP BY CombinedTables.Type, CombinedTables.Category, CombinedTables.[pension rollup], CombinedTables.[Date];

#This SQL code creates a new table called "Pension Division" by combining data from four different tables: "FACPENSION," "PLANGENPENSION," "CJAPENSION," and "CONSULTANTSPENSION." The code performs four separate SELECT queries using UNION ALL to combine data from each source table.

#Each SELECT query within the UNION ALL includes columns for "Type," "Category," "[pension rollup]," and "[Date]," along with columns for summing values from each source table, named "FAC_SUM," "Plangen_SUM," "CJA_SUM," and "Consultants_SUM."

#The main query then groups the data from the UNION ALL results based on "Type," "Category," "[pension rollup]," and "[Date]." It calculates the sum of "FAC_SUM," "Plangen_SUM," "CJA_SUM," and "Consultants_SUM" for each group using the SUM function.

#The result is a new table "Pension Division" containing grouped data from the four source tables, where each row represents a unique combination of "Type," "Category," "[pension rollup]," and "[Date]," along with the corresponding sums from each source table. The calculated total sum of "FAC_SUM," "Plangen_SUM," "CJA_SUM," and "Consultants_SUM" for each group is also included in the new table.

