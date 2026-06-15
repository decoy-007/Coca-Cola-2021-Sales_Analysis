--================================================
--Month with the biggest sales increase
--================================================
select top 1*,
current_month - previous_month as difference
from(
select
month(Invoice_Date) Month,
sum(Total_Sales) current_month,
lag(sum(Total_Sales)) Over (order by month(Invoice_Date)) previous_month
from Sales
group by month(Invoice_Date)
)t
order by difference desc