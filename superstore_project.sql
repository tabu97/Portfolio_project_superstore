use superstore_project;

select * from dbo.Orders$;
select count(*) from dbo.Orders$;

select * from dbo.Orders$ order by 1;

--  checking whether order ID is primary key or not
select [Order ID],count(*) from dbo.Orders$
group by [Order ID] having count(*)>1
order by count(*) desc;


--SANITY CHECK
-- checking ship date > order Date
SELECT * FROM dbo.Orders$ where [Order Date]>[Ship Date];
-- null values

-- checking for distinct shipe mode
select distinct [Ship Mode] from dbo.Orders$;

-- checking for days range according to ship mode
select datediff(day,[Order Date],[Ship Date]) as num_of_days,* from dbo.Orders$
where [Ship Mode]= 'First Class'
order by num_of_days desc;

select min(a.num_of_days),max(a.num_of_days) from 
(select datediff(day,[Order Date],[Ship Date]) as num_of_days,* from dbo.Orders$
where [Ship Mode]= 'First Class') a ;
 -- First class = 1-3 days

 select datediff(day,[Order Date],[Ship Date]) as num_of_days,* from dbo.Orders$
where [Ship Mode]= 'Second Class'
order by num_of_days desc;

select min(a.num_of_days),max(a.num_of_days) from 
(select datediff(day,[Order Date],[Ship Date]) as num_of_days,* from dbo.Orders$
where [Ship Mode]= 'Second Class'
) a;
-- Second class = 2to5 days

select datediff(day,[Order Date],[Ship Date]) as num_of_days,* from dbo.Orders$
where [Ship Mode]= 'Standard Class'
order by num_of_days desc;

select min(a.num_of_days),max(a.num_of_days) from 
(select datediff(day,[Order Date],[Ship Date]) as num_of_days,* from dbo.Orders$
where [Ship Mode]= 'Standard Class'
) a;
-- Standard class = 4to7 days



-- checking for customers orders
select [Customer ID],[Order ID],count(*) as num_of_orders
from dbo.Orders$
group by [Customer ID],[Order ID]
order by count(*) desc;

select [Customer ID],[Order ID],count(*) as num_of_orders
from dbo.Orders$
group by [Customer ID],[Order ID]
order by [Customer ID];


--sales by category and subcategory
select [Category],[Sub-Category],round(sum(Sales),0) as total_sales
from dbo.Orders$
group by [Category],[Sub-Category]
order by [Category],total_sales desc;


--Quantity sold by category and subcategory
select [Category],[Sub-Category],count(Quantity) as total_Quantity_sold
from dbo.Orders$
group by [Category],[Sub-Category]
order by [Category],total_Quantity_sold desc;


-- sales by market 
select Market, round(sum(sales),0) as Total_sales
from dbo.Orders$
group by Market
order by Total_sales desc;
-- 20+ countries that make up the Asia-Pacific market (APAC) has largest sales


--PROFIT BY MARKET
select Market, round(sum(Profit),0) as Total_profit
from dbo.Orders$
group by Market having round(sum(Profit),0) >0
order by Total_profit desc;
-- 20+ countries that make up the Asia-Pacific market (APAC) has largest profit


-- SALES BY REGION, COUNTRY AND STATE
select Region,Country,State,round(sum(sales),0) as total_sales
from dbo.Orders$
group by Region,Country,State
order by Region,total_sales desc;

select Region,Country,State,round(sum(sales),0) as total_sales
from dbo.Orders$
group by Region,Country,State
order by total_sales desc;

-- PROFIT BY REGION, COUNTRY AND STATE
select Region,Country,State,round(sum(profit),0) as total_profit
from dbo.Orders$
group by Region,Country,State
order by Region,total_profit desc;

select Region,Country,State,round(sum(profit),0) as total_profit
from dbo.Orders$
group by Region,Country,State
order by total_profit desc;

-- customers with highest orders
select [Customer Name],count([Customer Name]) from dbo.Orders$
group by [Customer Name]
order by count([Customer Name]) desc;

-- segment with high orders
select [Segment], count([Segment]) from dbo.Orders$
group by [Segment]
order by count([Segment]) desc;
-- consumer segment has high orders


-- different order priorites with Category and Total_Sales
select distinct [Order Priority] from dbo.Orders$;

select [Order Priority], count([Order Priority])as count_of_Order_Priority from dbo.Orders$
group by  [Order Priority]
order by count([Order Priority]) desc;

select Category, [Order Priority],count([Order Priority])as count_of_Order_Priority from dbo.Orders$
group by [Order Priority],Category
order by Category,count([Order Priority]) desc;

select Category, [Sub-Category], [Order Priority],count([Order Priority])as count_of_Order_Priority from dbo.Orders$
group by [Order Priority],Category,[Sub-Category]
order by Category,count([Order Priority]) desc;


select Segment,[Order Priority],count([Order Priority])as count_of_Order_Priority from dbo.Orders$
group by [Order Priority],Segment
order by Segment,count([Order Priority]) desc;


select Segment,[Order Priority],round(sum(Sales),0)as total_sales from dbo.Orders$
group by [Order Priority],Segment
order by Segment,sum(Sales) desc;









