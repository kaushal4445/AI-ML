select * from `e1.products`

select SupplierID , 
count(*) as no_Products 
from `e1.products`
group by SupplierID
order by no_Products desc

select * from `e1.order_items`


Select ProductID, 
sum(Total) as TOTAL 
from `e1.order_items`
group by ProductID
order by TOTAL desc
limit 10


select ProductID,
sum(Total) as TL_SALES
from `e1.order_items`
group  by ProductID
having TL_SALES > 50000
order by TL_SALES desc

select * from `e1.payments`


select 
Method,
count(*) as no_of_transcations,
sum(amount) as total_payment
from `e1.payments`
where Status = "Success"
group by  Method
order by total_payment  desc


select * from `e1.orders`

select 
CustomerID,
count(*) as no_of_orders
from `e1.orders`
where Status = "Shipped"
group by CustomerID
having no_of_orders > 3
order by no_of_orders desc

select 
CustomerID,
count(*) as no_of_orders
from `e1.orders`
group by CustomerID
having no_of_orders > 3
order by no_of_orders desc


select 
CategoryID, 
count(*) as count_product
from `e1.products`
where MRP > 20000
group by CategoryID
having count_product > 2

select * from `e1.inventory`


select
WarehouseID, 
sum(Stock) as T_STOCK,
avg(Stock) as AVG_STOCK,
max(Stock) as MX_STOCK,
min(Stock) as MN_STOCK
from `e1.inventory`
group by WarehouseID
order by T_STOCK desc

select * from `e1.orders`

select Status ,
count(*) as no_of_orders
from `e1.orders`
group by Status
order by no_of_orders desc

select * from `e1.order_items`


select ProductID,
sum(Quantity) as T_QUANTITY,
sum(Total) as TOTAL_SALES,
avg(SellingPrice) as AVG_SP
from `e1.order_items`
where  SellingPrice > 10000
group by ProductID
having TOTAL_SALES > 50000
order by TOTAL_SALES desc



