-- for every Customer , calcualte:
-- CustomerID
-- Customer Name
-- Number of orders places
-- Total amount paid through successful payments only
-- Display only customers whose successful payment amount is jgreater than 50 000
-- Sort customers from highest to lowest successful payment amount.


select 
c.CustomerID,
c.Name,
count( distinct o.OrderID) as no_of_orders,
sum(p.Amount) as T_AMT
from  `e1.customers` as c  
inner join `e1.orders` as o   
on o.CustomerID = c.CustomerID
inner join `e1.payments` as p  
on p.OrderID = o.OrderID
where p.Status = "Success" 
group by c.CustomerID, c.Name
having  T_AMT > 5000
order by no_of_orders desc



ProductID
ProductName
CategoryNmae
SuppplierName
Number of times the product appeared in order items
Total quantity sold
Total sales values
Average selling price

-- Only  include products where the total sales value is grater thsn 100000


select
p.ProductID,
p.ProductName,
c.CategoryName,
s.SupplierName, 
count(oi.ProductID) as no_of_pr,
sum(oi.Quantity) as T_Q,
sum(oi.Total) as T_s,
avg(oi.SellingPrice) as AVG_SP
from `e1.products` as p    
inner join `e1.categories` as c  
on p.CategoryID = c.CategoryID
inner join `e1.suppliers` as s            
on   p.SupplierID = s.SupplierID
inner join  `e1.order_items`   as oi          
on p.ProductID = oi.ProductID
group by p.ProductID,
p.ProductName,
c.CategoryName,
s.SupplierName
having T_s > 100000
order by T_s desc
limit 10


-- consider only products having on MRP greater than 20000

-- for every category , calculate;
-- CategoryID
-- CategoryName
-- Number of qualifying Products
-- Avergae Mrp of qualifying products
-- MAX mrp
-- MIN mrp

-- Display only categories hacing more than qualifying procts.

-- sort by avergae mrp from highhest to lowest.

-- select 
c.CategoryID,
c.CategoryName,
count(p.ProductID) as qualifying_products,
max(p.MRP) as MAX_MRP,
min(p.MRP) as MIN_MRP,
Avg(p.MRP) as avg_mrp
 from `e1.products` as p    
inner join `e1.categories` as c  
on p.CategoryID = c.CategoryID
where p.MRP > 2000
group by c.CategoryID,
c.CategoryName
having qualifying_products >2
order by avg_mrp desc






-- find all customers who have never placed an order.

-- Display:

-- CustomerID
-- CustomerName
-- City State

-- Sort the result alphabetically by customer name


select 
c.CustomerID,
c.Name,
c.City,
o.OrderID
from `e1.customers` as c              
left join  `e1.orders`  as   o    
on c.CustomerID = o.CustomerID
where o.OrderID is null    
order by c.Name










select
s.SupplierID, 
s.SupplierName,
count(distinct p.ProductID) as p_c,
avg(p.MRP) as AG,
sum(oi.Total) as TL
from `e1.suppliers` as s    
left join `e1.products` as p      
on s.SupplierID = p.SupplierID 
left join `e1.order_items` as oi   
on p.ProductID = oi.ProductID       
group by s.SupplierID, 
s.SupplierName

order by TL desc




















