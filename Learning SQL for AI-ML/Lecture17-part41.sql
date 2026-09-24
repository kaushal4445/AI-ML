-- for every wrehouse, calculte:

-- WarehouseID
-- Warehouse name
-- Number of orders handled
-- Total quantity of produvts sold
-- Tottal sales value

-- Include warehouse even if they have no orders
-- Display only warehouse where the totl sales  value is greater than 200000
-- Sort fro highest to lowest total sales


-- alter table `e1.warehouses` 
-- rename column string_field_0 to WarehouseID

-- alter table `e1.warehouses` 
-- rename column string_field_1 to WarehouseName

select
w.WarehouseID, w.WarehouseName,
count(distinct o.OrderID) as no_of_ordes,
coalesce(sum(oi.Total)) as total_s,
coalesce(sum(oi.Quantity)) as total_qt
from `e1.warehouses` as w        
inner join `e1.orders` as o             
on o.WarehouseID = w.WarehouseID
inner join `e1.order_items` as oi 
on oi.OrderID = o.OrderID
group by w.WarehouseID, w.WarehouseName
having total_s >200000
order by total_s desc






-- calculate the total sales  value generated vy every customer

-- then display only those customers total spendign is greater than the average customer spending

-- Display:
-- CustomerID
-- CustomerName
-- Total spending

-- sort from highest spending to lowest.

select round(avg(toal_sales), 2)
from 
(select
o.CustomerID, 
sum(oi.Total) as toal_sales 

from `e1.order_items` as oi            
inner join `e1.orders` as o           
on oi.OrderID = o.OrderID
group by o.CustomerID)





select 
c.CustomerID, c.Name,
sum(oi.Total) as total_sales
from `e1.customers` as c             
inner join `e1.orders` as o             
on c.CustomerID = o.CustomerID
inner join `e1.order_items` as oi       
on oi.OrderID = o.OrderID
group by  c.CustomerID, c.Name
having total_sales > (
select round(avg(total_sales), 2)
from 
(select
o.CustomerID, 
sum(oi.Total) as total_sales 
from `e1.order_items` as oi            
inner join `e1.orders` as o           
on oi.OrderID = o.OrderID
group by o.CustomerID)
)
order by total_sales desc





-- for every product, calculate its total sales value.

-- display only products whose total sales value is grater than the average total sales value of products belonging to the same category.


-- Display:

-- ProductI
-- ProductNmae
-- CategoryName
-- TotalSales

-- Sort by tottal sales from highest to lowest.






select 
p.ProductID, 
c.CategoryName,
p.CategoryID,
p.ProductName,
sum(oi.Total) as Total_Sales
from  `e1.products` as p
inner join `e1.categories` as c
on p.CategoryID = c.CategoryID
inner join `e1.order_items` as oi      
on oi.ProductID = p.ProductID
group by p.ProductID,
c.CategoryName,
p.CategoryID,
p.ProductName
having Total_Sales  > (select 
avg(Total_Sales) as AVG_SALES
from
(select
p1.ProductID,
sum(oi.Total) as Total_Sales
from `e1.products` as p1   
inner join `e1.order_items` as oi 
on p1.ProductID = oi.ProductID
where p1.CategoryID = p.CategoryID
group by p1.ProductID
 ))
order by Total_Sales desc




-- for every order , calculate the total order  value by adding the Total column from order_items

-- Then classify each order as :
 
--  high Value -> Toal order value >= 50000
--  Medium Value -> Total order by value batween 20000 and 49000
--  low value -> Total order value < 20000

--  Display :
--  OrderID
--  OrderDate
--  CustomerName
--  TotalOrderValue
--  TotalOrderValue
--  OrderCategory


--  show the highest - value orders first.


--case   when statements
--if -elseif-else

-- synatax:

-- case
-- when condition1 then result1
-- when condition2 then result2
-- when condition3 then result3
-- when condition4 then result3
-- else default_result
-- end


-- categories caustomers as replica of
-- 18-20 :  genz,
-- 21-40 : adult,
-- 41 onwards : senior_citizens



select 
CustomerID,
Age,
Name,
case
  when Age >= 18 and Age <= 20 then "Genz"
   when Age >= 21 and Age <= 40 then "Adult"
   else"Senior_Citizen"
   end as age_Group
 from `e1.customers`   as c


-- F--> Female
-- M--> MAle

select
CustomerID,
Age,
Name,
case
  when Gender = "F"  then "Female"
   when Gender = "M"  then "Male"
   end as Indentity
 from `e1.customers`   as c


