--========================================================
--Find the month over month Sales and calculate the change
--========================================================
with monthlySales as(
select
MONTH(Invoice_Date) Month,
sum(Total_Sales) AS MonthlySales
from Sales
group by MONTH(Invoice_Date)
)
select*,
LAG(MonthlySales) OVER (order by Month) PreviousMonthSales,
MonthlySales - LAG(MonthlySales) OVER (order by Month) MoM_Change,
CASE 
    WHEN MonthlySales > LAG(MonthlySales) OVER (order by Month) THEN 'Increased sales'
    WHEN MonthlySales = LAG(MonthlySales) OVER (order by Month) THEN 'No change'
    ELSE 'Decreased sales'
END [Growth Indicator]
from monthlySales;