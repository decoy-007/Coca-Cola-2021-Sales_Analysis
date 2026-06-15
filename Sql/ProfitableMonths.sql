--===============================================
-- Find months where sales increased 
--===============================================
with monthlySales as(
select
MONTH(Invoice_Date) Month,
sum(Total_Sales) AS MonthlySales
from Sales
group by MONTH(Invoice_Date)
),
salesWithLag AS(
    select*,
    LAG(MonthlySales) OVER (order by Month) PreviousMonthSales
    from monthlySales
),
final as(
    select*,
    MonthlySales - PreviousMonthSales AS MoM_Change,
    CASE 
        WHEN MonthlySales > PreviousMonthSales THEN 'Increased Sales'
        WHEN MonthlySales = PreviousMonthSales THEN 'No Change'
        ELSE 'Decreased Sales'
    END [Growth Indicator]
    from salesWithLag
)
select*
from final
WHERE MonthlySales > PreviousMonthSales