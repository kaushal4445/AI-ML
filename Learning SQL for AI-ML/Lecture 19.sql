-- for every employee, calculate:
-- EmployeeID,
-- EmployeeNmae,
-- Department 
-- Number of ordrers handled
-- Number of orders whose tottal values exceeds  50000 --> case when
-- total sales value of all orders handled---> orders_items

-- Display only employees who have handled at least 5 orders.--> having

-- Sort employees by tottal sales value from highest to lowest.



select 
e.EmployeeID,
e.Name,
e.Department,
count(distinct o.OrderID) AS order_handled,
count(
  distinct case
  when OrderTotals.order_value > 50000
  then o.OrderID
  end
) as HighValueOrders,
sum(OrderTotals.order_value) as total_s
from `e1.employees` as e    
inner join `e1.orders` as o   
on e.EmployeeID = o.EmployeeID
inner join (select OrderID,
sum(Total) as order_value
from `e1.order_items` as oi
group by OrderID) as OrderTotals
on o.OrderID= OrderTotals.OrderiD
group by e.EmployeeID,
e.Name,
e.Department
having order_handled >= 5
order by total_s  desc




-- for every empolyee, calculate;

-- EmployeeiD,
-- EmployeenNAME,
-- DEPARTMENT
-- Member of orders handled
-- number of different customers served

-- Display only employees who have handled more than 5 orders

-- sort emploees by number of orders handled from highest to lowest






select
e.EmployeeID,
e.Name, e.Department,
count(distinct o.OrderID) as orders_handled,
count(distinct o.CustomerID) as Customers_served
from `e1.employees` as e       
inner join `e1.orders` as o   
on e.EmployeeID = o.EmployeeID
group by e.EmployeeID,
e.Name, e.Department
having orders_handled >= 5
order by orders_handled desc




-- for every city, calculate:
-- number of customers
-- number of oders
-- total sales valuesaverage order-item alue

-- Display only cities where the total sales value is greater than 3 00 000

-- sort cities by totalsales in descdening order




select
c.City,
count(distinct c.CustomerID) as customers,
count(distinct o.OrderID) as orders,
sum(oi.Total) as T_S,
avg(oi.Total) as AVG_OIV
from `e1.customers` as c   
inner join `e1.orders` as o    
on c.CustomerID = o.CustomerID
inner join `e1.order_items` as oi    
on o.OrderID = oi.OrderID
group by c.City
having T_S > 300000
order by T_S desc








-- fro evry productthat beensold,  clculate:

-- ProductID,
-- ProductNmae,
-- number of orders conting the product,
-- total quantity sold
-- Average selling Price


-- Display only products whose avergae selling Price is greater than 15000
-- Show the highest average selling price first .




select
p.ProductID,
p.ProductName,
count(distinct oi.OrderID) as orders_containng ,
sum(oi.Quantity) as T_Q,
avg(oi.SellingPrice) as AVG_SP
from `e1.products` as p    
inner join `e1.order_items` as oi   
on p.ProductID = oi.ProductID
group by p.ProductID,p.ProductName
having AVG_SP > 15000
order by AVG_SP  desc





for every category, calculate:
CategorY Nmae,
number of products,
Minumun MRP,
maximum MRp,
Difference betwwen maximum and minimum MRp
Display only categories where differevce between the maximum and minimum MRP is greater than 10 000 



select 
c.CategoryName, 
count(distinct p.ProductID) as n_p,
max(p.MRP) AS max_MRP,
min(p.MRP) as min_MRP,
max(p.MRP) - min(p.MRP) as Difference_MRP
from `e1.categories` as c   
inner join `e1.products` as p   
on c.CategoryID = p.CategoryID
group by c.CategoryName
having Difference_MRP > 10000




-- for each payment method, calculate:
-- number of succesful trancations
-- Total successful payment amount
-- Average succeful trranction amont
-- Maximumsuccessfil trancation amount

-- Display oly payments method having more than 10 successful trancation .

-- sort by average transcations amont from highest to lowest .



select  p.Method,
count(*) as s_t,
sum(p.Amount) as s_a,
avg(p.Amount) as avg_t,
max(p.Amount) as max_t
from `e1.payments` as p   
where p.Status = "Success"
group by p.Method
having s_t > 10
order by avg_t desc





-- find the top 10 products based on totl quantity sold:

-- Display:
-- ProductID
-- ProduvtNmae
-- Category N,ae
-- total quantity sold
-- total sales values
-- sORT BY QUANTITY SOLD FROM HIGHREST TO LOWEST




select
p.ProductID,
p.ProductName,
c.CategoryName,
sum(oi.Total) as t_s,
sum(oi.Quantity) as t_q
from `e1.categories` as c      
inner join `e1.products` as p    
on c.CategoryID = p.CategoryID
inner join `e1.order_items` as oi 
on oi.ProductID = p.ProductID
group by p.ProductID,
p.ProductName,
c.CategoryName
order by t_q desc


-- fro evrey warehouse, calculate:
-- WarehouseID,
-- Wrehouse,
-- Number of inventory rescords
-- Total stock
-- Average stock
-- highest stock in a single inventory record

-- Display only warehouses where the average stock per inventory record is gretaer than 100.

-- Sort by total stock descending.

select 
w.WarehouseID, 
w.WarehouseName,
count( distinct i.ProductID) as  i_records,
sum(i.Stock) as T_S,
avg(i.Stock) as avg_S,
max(i.Stock) as HIGH
from `e1.warehouses` as w   
inner join `e1.inventory` as i    
on w.WarehouseID = i.WarehouseID
group by w.WarehouseID, 
w.WarehouseName
having  i_records > 100
order by T_S desc














