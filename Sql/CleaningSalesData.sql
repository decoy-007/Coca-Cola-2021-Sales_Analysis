-- ==================================================================================
 /* 
    Repalcing text in numeric columns to change data type to decimal(Permanent Change)
 */
--===================================================================================

UPDATE Sales
SET
    [Price_per_Unit] = REPLACE(REPLACE([Price_per_Unit], '$', ''),',', ''),
    [Total_Sales] = REPLACE(REPLACE([Total_Sales], '$', ''), ',', ''),
    [Operating_Profit] = REPLACE(REPLACE([Operating_Profit], '$', ''), ',', ''),
    [Operating_Margin] = REPLACE([Operating_Margin], '%' , ''),
    [Units_Sold] = REPLACE([Units_Sold], ',' , '' )

--=============================================================================
/*
    Altering columns to appropriate data types(Permanent change)
*/
--============================================================================
ALTER TABLE Sales
ALTER COLUMN [Price_per_Unit] DECIMAL(10,1);

ALTER TABLE Sales
ALTER COLUMN [Total_Sales] DECIMAL(12,2);

ALTER TABLE Sales
ALTER COLUMN [Operating_Profit] DECIMAL(12,2);

ALTER TABLE Sales
ALTER COLUMN [Operating_Margin] DECIMAL

ALTER TABLE Sales
ALTER COLUMN [Year] Date

ALTER TABLE Sales
ALTER COLUMN [Invoice_Date] Date

ALTER TABLE Sales
ALTER COLUMN [Units_Sold] DECIMAL