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
