--========================================
--Total sales of top 2 beverages in Regions
--========================================
with regionRevenue as(
select
Region,
Beverage_Brand,
SUM(Total_Sales) as Revenue,
ROW_NUMBER() OVER (PARTITION BY Region order by SUM(Total_Sales) DESC) as rank
from Sales
group by Region,
        Beverage_Brand
)
select*
from regionRevenue
where rank <=2;
