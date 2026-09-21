---Display allproducts and any order-item sales associated with item


select p.ProductName,
p.ProductID,
sum(o.Total) as SALES
from `e1.products` as p
inner join `e1.order_items` as o
on p.ProductID = o.ProductID
group by p.ProductName , p.ProductID
order by SALES desc



-- find Products with No Sales

select p.ProductName,
p.ProductID
from `e1.products` as p 
inner join `e1.order_items` as o 
on p.ProductID = o.ProductID
where p.ProductID is null
group by p.ProductName, p.ProductID




--Customers who registered but have never placed an order

select 
c.Name,
c.CustomerID,
o.OrderID
from  `e1.orders` as o  
inner join `e1.customers` as c  
on o.CustomerID = c.CustomerID
where o.OrderID is null



--for every customer, show the number of ordes they have plced.
-- including customers with zero orders



select 
c.Name,
c.CustomerID,
count(*) as N0_p
from  `e1.customers` as c  
right  join `e1.orders` as o
on c.CustomerID = o.CustomerID
-- where o.OrderID is null and  o.Status = "Shipped"
group by c.Name,
c.CustomerID
order by  N0_p asc



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
count(*) as NO_Prod
from  `e1.customers` as c  
inner join `e1.orders` as o   
on o.CustomerID = c.CustomerID
inner join `e1.payments` as p  
on p.OrderID = o.OrderID
where p.Status = "Success" and p.Amount > 50000
group by c.CustomerID, c.Name
order by NO_Prod desc







