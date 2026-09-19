-- find all the products whose mrp  is grater  than average mrp

select ProductID, 
MRP
from `e1.products`
where 
MRP > (select round(avg(MRP), 2) from `e1.products`)
group by ProductID , MRP


--filter out those products whose mrp is among the top 5 distinct highesr mrps.

select MRP
from `e1.products`
order by MRP desc
limit 5


select * from `e1.products`
where (MRP = 4937) or (MRP = 4927) or 
(MRP = 4880)  or (MRP = 4698) OR
 (MRP = 4662)



select * 
from `e1.products`
where MRP in (4937, 4927, 4880, 4980, 4662)

select * from `e1.products`
where MRP in (select distinct(MRP)
from `e1.products`
order by MRP desc
limit 5)


select * from `e1.products`
where  MRP = 4937

select * from `e1.products`
where MRP = (select max(MRP) from `e1.products`)

select * from `e1.products`
where MRP in (select max(MRP) from `e1.products`)


--find roducts supplied by suppliers who supply at least 5 products

select SupplierID , 
count(*) as no_od_products from `e1.products`
group by SupplierID
having no_od_products >= 5

select * 
from `e1.products`
where SupplierID in (select SupplierID , 
from `e1.products`
group by SupplierID
having count(*)  >= 5)

 -- find customer IDs who been placed atleast 3 orders

 select CustomerID, 
 count(*) as atleast_orders 
 from `e1.orders`
 group by CustomerID
 having atleast_orders >= 3
 order by atleast_orders desc


select * from `e1.customers`
where CustomerID in (select CustomerID from `e1.orders`
group by CustomerID 
having count(*) >= 3)


--find suppliers whose number of products is grater than the average nu,ber of products supliied per supplier


select avg(no_of_products) from (select SupplierID, count(*) as no_of_products
 from `e1.products` 
group by SupplierID)


select SupplierID , count(*) as no_prds from
`e1.products`
group  by SupplierID
having count(*) > (select avg(no_of_products)
from (select SupplierID, 
count(*) as no_of_products
 from `e1.products` 
group by SupplierID))


select SupplierID , count(*) as no_prds from
`e1.products`
group  by SupplierID
having count(*) >= (select avg(no_of_products)
from (select SupplierID, 
count(*) as no_of_products
 from `e1.products` 
group by SupplierID))



