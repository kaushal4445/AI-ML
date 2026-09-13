select * from `e1.customers`

select  distinct(city) from `e1.customers`

select count(distinct city) from `e1.customers`

select * from `e1.products`

select distinct(ProductName)from `e1.products`

select count(distinct ProductName)from `e1.products`

select count( distinct Name) from  `e1.customers` where city = "Mumbai"


select count(distinct Name) from `e1.customers`

count (column) counts the number of non-null values in that column
select count(CustomerID) from `e1.customers`

SELECT DISTINCT State
FROM `e1.suppliers`;

select * from `e1.order_items`



select sum(Total) from `e1.order_items`

select sum(Quantity) from `e1.order_items`

select sum(Quantity) from `e1.order_items` where Quantity > 1




