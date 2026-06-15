--=================================================
-- Find which Retailer contributes the most sales
--=================================================
with salesByRetailer as(
select
Retailer,
SUM(Total_Sales) [total by retailer]
from sales
group by Retailer
)
select*,
sum([total by retailer]) over() as [total overall sales],
CONCAT(ROUND(([total by retailer] /sum([total by retailer]) over()) * 100,1),'%') as [Percentage of Overall sales]
from salesByRetailer
order by [Percentage of Overall sales] desc