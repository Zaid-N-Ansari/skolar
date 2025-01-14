select Country, City, [Total Sales]
from(
	select L.Country, L.City, SUM(F.Sales) 'Total Sales', DENSE_RANK() over(PARTITION by L.Country order by SUM(F.Sales) desc) 'CitiesRankBySales'
	from Fact F left join Location L on F.[Location ID]=L.[Location ID]
	group by L.Country,L.City
) T
where CitiesRankBySales <= 3
order by Country



WITH YearlySales AS (
    SELECT 
        YEAR([Order Date]) AS SalesYear,
        SUM(Sales) AS YearlySales, 
        LAG(SUM(Sales)) OVER (ORDER BY YEAR([Order Date])) AS PrevYearSales
    FROM Fact
    GROUP BY YEAR([Order Date])
),
YearGrowth AS (
    SELECT 
        SalesYear, 
        YearlySales, 
        IIF(PrevYearSales IS NULL, 0, (YearlySales - PrevYearSales) * 100 / PrevYearSales) AS 'YoY Sales Growth'
    FROM YearlySales
)
SELECT * 
FROM YearGrowth


select Country, AVG(AvgCitySales)
from(
	select L.Country, L.City, AVG(F.Sales) 'AvgCitySales'
	from Fact F left join Location L on F.[Location ID]=L.[Location ID]
	group by L.Country, L.City
) T
group by Country
order by Country



with cte as(
	select Country, count(City) 'No. of Cities'
	from (
		select L.Country, L.City, SUM(F.Sales) 'TotalCitySales'
		from Fact F left join Location L on F.[Location ID]=L.[Location ID]
		group by L.Country, L.City
		having SUM(F.Sales) > 10000
	) T
	group by Country
	having count(City) >= 5
)
select count(Country) 'No. of Country'
from cte




select C.[Customer ID], avg(F.[Sales])
from Fact F left join Customer C on F.[Customer ID]=C.[Customer ID]
group by C.[Customer ID]
order by avg(F.[Sales])








select count([Customer ID]) 'No. of Indian Customers in Loss'
from(
select c.[Customer ID], sum(f.Profit) 'TotalProfit'
from Fact F left join Location L on F.[Location ID]=l.[Location ID] left join Customer C on c.[Customer ID]=f.[Customer ID]
where L.Country='India'
group by c.[Customer ID]
having sum(f.Profit) < 0
) T

with cte as(
	select Segment, [Sub-Category], [SubCat-Seg Sales], DENSE_RANK() OVER(partition by Segment order by [SubCat-Seg Sales] desc) 'RankedBySubCat-Seg Sales'
	from(
		select C.Segment, P.[Sub-Category], sum(F.Sales) 'SubCat-Seg Sales'
		from Fact F
			left join Customer C on F.[Customer ID]=C.[Customer ID]
			left join Product P on F.[Product ID]=P.[Product ID]
		group by C.Segment, P.[Sub-Category]
	) T
)
select Segment, [Sub-Category], [SubCat-Seg Sales]
from cte
where [RankedBySubCat-Seg Sales]=1



with QuarterlySales as(
	select
		DATEPART(QUARTER, [Order Date]) 'SalesQuarter',
		sum(Sales) 'QuarterlySales',
		lag(sum(Sales)) over(order by DATEPART(QUARTER, [Order Date])) 'PrevQuarterSales'
	from Fact F left join Location L on F.[Location ID]=L.[Location ID]
	where L.Country='India'
	group by DATEPART(QUARTER, [Order Date])
),
QuarterlyGrowth as (
	select SalesQuarter, QuarterlySales, PrevQuarterSales, (QuarterlySales-PrevQuarterSales)*100/PrevQuarterSales 'QoQ India Growth %'
	from QuarterlySales
)
select * from QuarterlyGrowth;



with cte1 as(
	select P.[Product Name], sum(F.Sales) 'Sales'
	from Fact F left join Product P on F.[Product ID]=P.[Product ID]
	where DATEPART(QUARTER, [Order Date]) = DATEPART(QUARTER, GETDATE())
	group by P.[Product Name]
),
cte2 as(
	select [Product Name], Sales, DENSE_RANK() over(order by Sales desc) 'rk'
	from cte1
)
select [Product Name], Sales from cte2 where rk <= 10




SELECT 
    C.[Segment],
    AVG(F.[Profit]) AS AverageProfitPerOrder
FROM 
    Fact F
JOIN 
    Customer C ON F.[Customer ID] = C.[Customer ID]
GROUP BY 
    C.[Segment];



select P.[Sub-Category], sum(F.Profit)*100/(select sum(Profit) from Fact) '% Profit'
from Fact F left join Product P on F.[Product ID]=P.[Product ID]
group by P.[Sub-Category]
order by '% Profit'