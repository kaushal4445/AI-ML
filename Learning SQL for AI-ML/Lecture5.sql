select avg(SellingPrice)  from  `e1.products`

select avg(SellingPrice) as AVG_SP from  `e1.products`


select * from `e1.payments`

select 
count(*) as NO_OF_PAYMNETS, 
sum(Amount) as TOTAL_Amount , 
avg(Amount) as AVG_Amount, 
min(Amount) as min_amount, 
max(Amount)  as max_ammount from `e1.payments` 


select *  from `e1.products`

select CategoryID, 
count(*) as product_count
from `e1.products`
group by CategoryID

select ProductID, 
 sum(Quantity) as  Total_Quantity
from `e1.order_items`
group by ProductID


select ProductID ,
 sum(Total) as Total_sales
from `e1.order_items`
group by ProductID

select ProductID ,
 avg(SellingPrice) as AVG_SP
from `e1.order_items`
group by ProductID


select ProductID,
count(*) as total_orders, 
sum(Total) as TOTAL_SALES ,
round(avg(Total), 2) as AVG_SALES ,
min(Total) as MIN_SALES  , 
max(Total) as MAX_SALES, 
 round (avg(SellingPrice),2) as AVG_SP, 
min(SellingPrice) as min_SP, 
max(SellingPrice)  as max_SP from `e1.order_items` 
group by ProductID

select CustomerID ,
 Status, 
count(*) as no_of_orders
from `e1.orders` 
group by CustomerID , Status


select CustomerID ,
 Status, 
count(*) as no_of_orders
from `e1.orders` 
group by  Status , CustomerID











