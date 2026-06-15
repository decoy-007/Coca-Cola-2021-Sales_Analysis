CREATE PROCEDURE CheckTotalUnitsSoldByState
    @State NVARCHAR (50)
AS
BEGIN
    SET NOCOUNT ON;
    SELECT
    Retailer,
    State,
    SUM(Units_Sold) AS TotalUnits
    from Sales
    WHERE State = @State
    group by Retailer,
             State
    Order by TotalUnits
END