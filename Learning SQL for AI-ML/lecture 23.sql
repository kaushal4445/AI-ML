-- the CRM TEAM wants to understand the sequence in which customers placeed their orders.

-- For every order , display:

-- CustomerId
-- ORDERId
-- orderDate
-- the order number for that customer


-- for exaple:

-- customers C001
-- first order -> 1
-- second order -> 2
-- third order -> 3

-- the numbering shuld be based on OrdeDate, 
-- from oldest to newest




-- select 
-- c.CustomerID,
-- o.OrderID,
-- o.OrderDate,
-- count( distinct o.OrderID) as orde_no
-- from `e1.customers` as  c   
-- inner join `e1.orders` as o 
-- on o.CustomerID = c.CustomerID
-- group by c.CustomerID,
-- o.OrderID,
-- o.OrderDate
-- order by o.OrderDate DESC




-- find the total amount successfully paid by each customer.

-- Displayy:

-- CustomeriD
-- CustomernName
-- Number of successful payments
-- Total successful payment amount                
-- show only customers whose successful payment amount is greater than 50 000



-- select 
-- c.CustomerID,
-- c.Name,
-- count( p.PaymentID) as s_p,
-- sum(p.Amount) as p_a
-- from `e1.customers` as c 
-- inner join `e1.orders` as  o   
-- on  o.CustomerID = c.CustomerID  
-- inner join `e1.payments` as p    
-- on  p.OrderID = o.OrderID
-- group by c.CustomerID,
-- c.Name
-- having p_a > 50000
-- order by p_a desc



-- for each  cattegory, calculate:


-- Category name
-- number of products
-- average mrp
-- average selling price
-- averge d_a

-- consider:-
-- Discount = mrp - sellingprice

-- Display categories with least 5 products



-- select 
-- c.CategoryName,
-- count( p.ProductID) as n_p,
-- round(avg(p.MRP),2)as a_mrp,
-- round(avg(p.SellingPrice),2) as a_sp,
-- round(avg(p.MRP - p.SellingPrice),2) as  discount
-- from `e1.categories` as c   
-- inner join  `e1.products`    as    p  
-- on p.CategoryID  = c.CategoryID
-- group by c.CategoryName
-- having  n_p  >= 5
-- order by discount desc





-- for every supplier, calcualte:

-- suppliername
-- number of products supplierid
-- nu,ber of order-item records
-- total quantity sold
-- totall sales value


-- Inculde suplliers even if they currently have no sales.

-- sort by total sales fro highest to lowest.


-- select 
-- s.SupplierName,
-- count(distinct p.ProductID) as n_p,
-- count(oi.OrderID) as o_i_records,
-- coalesce(sum(oi.Quantity),0)  as t_q,
-- coalesce(sum(oi.Total)) as t_s
-- from `e1.suppliers` as  s
-- inner join `e1.products` as p      
-- on p.SupplierID = s.SupplierID
-- inner join `e1.order_items` as oi  
-- on oi.ProductID = p.ProductID
-- group by s.SupplierName
-- order by t_s desc





-- for every warehouse , cslcuslte:

-- warehousename
-- number ppf orders handled
-- totla inventory record
-- average inventory stock
-- include warehouseds even if they have no orders.




-- select 
-- w.WarehouseName,
-- count( distinct o.OrderID) as o_h,
-- coalesce(sum(i.Stock), 0) as t_s,
-- coalesce(round(avg(i.Stock),2),0) as ag_in
-- from `e1.warehouses` as w  
-- inner join `e1.orders` as o   
-- on o.WarehouseID = w.WarehouseID
-- inner join `e1.inventory` as i   
-- on i.WarehouseID = w.WarehouseID
-- group by w.WarehouseName


-- find the category whose products have the highest average selling price

-- Disply:

-- Category ID:
-- Category name
-- Avergae selling price




-- select 
-- c.CategoryID,
-- c.CategoryName,
-- round(avg(p.SellingPrice), 2)  as    avy_hsp
-- from `e1.categories` as c   
-- inner join `e1.products` as   p
-- on p.CategoryID = c.CategoryID
-- group by c.CategoryID,
-- c.CategoryName
-- ORDER by avy_hsp desc
-- limit 1



-- for every supplier, rank their  products according o selling price , from highest to lowest


-- Display:
-- Supliername
-- ProductNmae
-- Selling Price
-- Rank within supplier 

-- select 
-- s.SupplierName,
-- p.ProductName,
-- p.SellingPrice,
-- rank() over(partition by s.SupplierID order by p.SellingPrice desc ) as s_p
-- from  `e1.suppliers` as s   
-- inner join `e1.products` as p    
-- on p.SupplierID = s.SupplierID






-------Date &time fuction-----------------------------------







-- show the details of the customers who have joined in the recent 1000 days



-- select 
-- c.CustomerID,
-- c.Name,
-- c.SignupDate
-- from `e1.customers` as c    
-- where SignupDate >= date_sub(current_date(), INTERVAL 1000 day)






-- select 
-- o.OrderID,
-- o.OrderDate,
-- extract(year FROM orderDate ) as order_year,
-- extract(month FROM orderDate ) as order_monthr,
-- extract(day FROM orderDate ) as order_day
-- from `e1.orders` as   o  



-- how many orders were placed  in each year?

-- select 
-- extract(year FROM orderDate ) as order_year,
-- count(*) as orders
-- from `e1.orders` as   o
-- group by order_year
--  order by order_year desc




-- select 
-- extract(month FROM orderDate ) as order_month,

-- count(*) as orders
-- from `e1.orders` as   o
-- group by order_month
--  order by order_month desc



-- select 
-- extract(month FROM orderDate ) as order_month,
-- extract(year FROM orderDate ) as order_year,
-- count(*) as orders
-- from `e1.orders` as   o
-- group by order_month, order_year
--  order by order_month desc , order_year desc






-- what were the total sales for each month?


-- select 
-- date_trunc(OrderDate, MONTH) as sales_month,
-- sum(oi.Total) as t_s
-- from `e1.orders` as   o  
-- inner join `e1.order_items` as oi   
-- on oi.OrderID = o.OrderID
-- group by sales_month
-- order by  sales_month




-- select
-- date_diff('2024-01-20', '2024-01-10', DAY)



-- how many days has each customer been registered?








select
CustomerID,
SignupDate,
date_diff(current_date(), SignupDate, DAY) as days
from `e1.customers`





























































