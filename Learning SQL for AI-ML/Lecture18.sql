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



select  
o.OrderID, 
o.OrderDate, 
c.Name ,
sum(oi.Total) as Total_sales,
case 
 when sum(oi.Total)  >= 50000 then "high Value"
 when sum(oi.Total) >= 20000 and sum(oi.Total)  <= 49000 then "Medium  Value"
 when sum(oi.Total)  < 20000 then "Low Value"
 end as  OrderCategory
from `e1.customers` as  c           
inner join `e1.orders` as o     
on o.CustomerID = c.CustomerID
inner join `e1.order_items` as oi     
on oi.OrderID = o.OrderID
group by o.OrderID, 
o.OrderDate, 
c.Name 
order by Total_sales desc



-- Create a category-level sales report containing :

-- CategoryID
-- CategoryName
-- nUMBER OF PRODUCTS in the category
-- Number of different products sold
-- Total quantity sold
-- Total sales value
-- Avergae selling price

-- only consider order-itwms records where:

-- Selling >  10000
-- Display only categories where:

-- Total sales values > 5,00, 000

-- sort cateogories from highest to lowest total sales 




select 
c.CategoryID, 
c.CategoryName,
count(distinct p.ProductID) as t_p,
count(distinct oi.ProductID) as D_T_P,
sum(oi.Quantity) as T_Q,
sum(oi.Total) as T_S,
avg(oi.SellingPrice) as AVG_SP
from `e1.categories` as c    
inner join `e1.products` as p    
on c.CategoryID = p.CategoryID
inner join `e1.order_items` as oi   
on oi.ProductID = p.ProductID
where oi.SellingPrice > 1000
group by c.CategoryID, 
c.CategoryName
having T_S > 50000
order  by T_S desc



-- find products where :
-- MRP is greater than 15 000
-- Discount percentage is greater than 20%
-- Total sales is greater than 75 000

-- Display :
-- ProductID
-- ProductName
-- Category name
-- MRP
-- SellingPrice
-- Discount Percentage -- derived field --> 
-- Total Sales


-- Sort by discout Percentage from highest to lowest 



select 
p.ProductID,
p.ProductName,
c.CategoryName,
p.MRP,
p.SellingPrice,
(p.MRP - p.SellingPrice)*100/p.MRP as D_P,
sum(oi.Total) as T_S
from `e1.categories` as c
inner join `e1.products` as p   
on  c.CategoryID = p.CategoryID
inner join `e1.order_items` as oi      
on oi.ProductID = p.ProductID
where  p.MRP > 15000
group by p.ProductID,
p.ProductName,
c.CategoryName,
p.MRP,
p.SellingPrice
having D_P > 20 and T_S > 75000
order by D_P desc















