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
