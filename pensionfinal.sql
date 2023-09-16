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
