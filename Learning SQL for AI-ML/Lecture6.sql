select * from `e1.products`

select count(*)  from `e1.products`

select CategoryID, count(*) as total_count from `e1.products`
group by CategoryID 

select * from `e1.order_items`

select ProductID,  
sum(Quantity) as units 
from `e1.order_items` 
group by ProductID


select ProductID,
sum(Total) as TOTAL_sales 
from `e1.order_items`
group by ProductID


select ProductID,
avg(SellingPrice) as AVG_SP
from `e1.order_items`
group by ProductID

select ProductID, 
min(SellingPrice) as LOW_SP,
max(SellingPrice) as HIGH_SP
from `e1.order_items`
group by ProductID



select ProductID, 
min(Total) as LOW_TL,
max(Total) as HIGH_TL
from `e1.order_items`
group by ProductID


select  CustomerID, Status,
count(*) as total_count 
from `e1.orders`
group by CustomerID, Status


select  WarehouseID  , 
count(Stock) as records
from `e1.inventory`
 group by WarehouseID


select EmployeeID, Status,
count(OrderID)  as TOTAL_ORDERS
from `e1.orders`
group by  EmployeeID, Status


select CategoryID ,
count(ProductID) as Total_products 
from `e1.products` 
where MRP > 2000
group by CategoryID


select ProductID, 
sum(Quantity) as total_Quantity
 from `e1.order_items`
 where Quantity > 1
 group by ProductID

select  Method,
round(avg(Amount),2) as AVG_PAYMENT
 from `e1.payments`
 where Status = "Success"
group by  Method















