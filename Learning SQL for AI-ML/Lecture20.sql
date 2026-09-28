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
count( distinct i.WarehouseID) as  i_records,
sum(i.Stock) as T_S,
avg(i.Stock) as avg_S,
max(i.Stock) as HIGH
from `e1.warehouses` as w   
inner join `e1.inventory` as i    
on w.WarehouseID = i.WarehouseID
group by w.WarehouseID, 
w.WarehouseName
-- having  i_records > 100
order by T_S desc



-- find the products that:
-- exist in the product catalgoue
-- have inventory records
-- have never appeared in an  order item

-- Display:
-- ProductId
-- productname
-- supplierid
-- number of inventory records
-- total stock

-- sort by total stock from highest to lowest



select
    p.ProductID,
    p.ProductName,
    p.SupplierID,
    COUNT(distinct i.WarehouseID) as i_records,
    sum(i.Stock) as t_s
from   `e1.products`   as p
inner join `e1.inventory` as  i           
on i.ProductID = p.ProductID
left join `e1.order_items` as oi
on p.ProductID = oi.ProductID
where oi.ProductID is null
group by  p.ProductID,
    p.ProductName,
    p.SupplierID
order by t_s desc





-- for eacg supplier, calculate:

-- SupplierNmae
-- Number of products
-- Averge MRp,
-- highest mrp
-- lowest mrp

-- Classify each supplier as :

-- Premium supplier if averge Mrp >= 30 000
-- mid - range Supplier if average mrp >= 15 000
-- budget Supplier otherwise

-- Display the suppliers wiith highest averge MRp first.





select
p.SupplierID,
count(distinct p.ProductID) as n_p,
avg(p.MRP) AS avg_mrp,
max(p.MRP) AS high_mtp,
min(p.MRP ) as low_mrp,
case
 when avg(p.MRP) >= 30000 then "PremiumSupplier"
 when avg(p.MRP) >= 15000 then "MidRangeSupplier"
 else "BudgetSupplier"
 end as Classify
from `e1.suppliers` as   s 
inner join `e1.products` as   p
on s.SupplierID = p.SupplierID
group by p.SupplierID
order by avg_mrp desc




-- Display:
-- Customerid
-- customername
-- number of different categories purchased
-- total quantity purchased
-- total amount spent

-- Sort by  number of different categories purchased from highest to lowest




select
c.CustomerID,
c.Name,
count(distinct  p.CategoryID) AS d_c,
sum(oi.Quantity) as T_Q,
sum(oi.Total) AS t_a
from `e1.customers` as c         
inner join `e1.orders` as o  
on c.CustomerID = o.CustomerID
inner join `e1.order_items` as oi     
on oi.OrderID = o.OrderID
inner join `e1.products` as p   
on p.ProductID = oi.ProductID
group by c.CustomerID,
c.Name
having d_c >= 3
order by  d_c desc





-- find customers who haven atleast one order associated with a failed payment


-- Display:

-- customerid
-- customername
-- number of orders having failed payments
-- total value of those orders

-- display value of those orders

-- display customers with the highest failed-payment order value first.


-- select distinct Status from `e1.payments`

select 
c.CustomerID,
c.Name,
COUNT( DISTINCT o.OrderID) as t_f_o,
sum(oi.Total) as t_v
from `e1.customers` as c        
inner join `e1.orders` as o     
on o.CustomerID  = c.CustomerID
inner join `e1.payments` as p    
on p.OrderID = o.OrderID
INNER JOIN `e1.order_items` AS oi   
on oi.OrderID = o.OrderID
WHERE p.Status = "Failed"
GROUP BY c.CustomerID,
c.Name
order by t_v desc






-- Find employee who have handled at least one order whose total value is greter then 75000

-- Display:

-- employeeid
-- employeename
-- number of high value order s
-- total value of high-value orders

-- average of high  value order amount

-- sort by total-highh value sales from high to low






select
e.EmployeeID,
e.Name,
COUNT(DISTINCT o.OrderID) AS N_F_P,
SUM(oi.Total) AS H_V_S_A,
AVG(oi.Total) as avg_H_V_S_A
from `e1.employees` as e     
inner join `e1.orders` as o    
on o.EmployeeID = e.EmployeeID
inner join `e1.order_items` as oi    
on oi.OrderID = o.OrderID
group by e.EmployeeID,
e.Name
having H_V_S_A >= 75000
order by H_V_S_A desc





