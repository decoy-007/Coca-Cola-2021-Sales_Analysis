--=================================================
--Find which beverage contributes to the most sales
--=================================================
with beverageTotals as(
select
Beverage_Brand,
SUM(Total_Sales) as totalByBev
from Sales
group by Beverage_Brand
)
select*,
sum(totalByBev) over () as overallSales,
ROUND((totalByBev/sum(totalByBev) over()) * 100,1) [percentage]
from beverageTotals
order by percentage desc