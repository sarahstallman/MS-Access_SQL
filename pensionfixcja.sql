SELECT Type, Category, Division, Date, [health rollup], [pension Rollup], Health, IIF(Corporate IS NULL AND Health IS NULL, Total, IIF(Corporate IS NOT NULL OR Health IS NOT NULL, [Life/Retirement Division], 0)) AS NewTotals INTO CJAFIXED
FROM CJA;

#This SQL code creates a new table called "CJAFIXED" by selecting specific columns from the "CJA" table and performing conditional calculations using the "IIF" function.

#The columns selected are "Type," "Category," "Division," "Date," "[health rollup]," "[pension Rollup]," and "Health" from the "CJA" table.

#The "IIF" function is used to calculate the "NewTotals" column. If both "Corporate" and "Health" columns in the "CJA" table are null, then the value from the "Total" column is used as "NewTotals." If either "Corporate" or "Health" columns in the "CJA" table are not null, then the value from the "[Life/Retirement Division]" column is used as "NewTotals." If both conditions fail, the value is set to 0.

#The resulting data is then inserted into the "CJAFIXED" table with the selected columns and the calculated "NewTotals" column.
