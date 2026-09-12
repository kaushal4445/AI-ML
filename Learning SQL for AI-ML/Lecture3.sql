select * from `e1.customers` limit 5

select distinct CustomerID from `e1.customers`

select * from `e1.customers` where CustomerID = "C014"

select  CustomerID, age, Gender from `e1.customers` where CustomerID = "C014"

select CustomerID, city from `e1.customers`

select * from  `e1.products` limit 5

select  * from `e1.customers` where city = "Nagpur"

select  * from `e1.customers` where Gender = "F"

select  * from `e1.customers` where age > 30

select * from `e1.products`

select * from `e1.products` where sellingPrice <= 50000

select * from `e1.orders`


select distinct Status from `e1.orders` 
select * from `e1.orders` where Status = "Delivered"

select * from `e1.orders` where Status != "Delivered"

select * from `e1.orders` where Status = "Cancelled"

select count(*) from `e1.customers`

select count(*) from `e1.customers` where city ="Mumbai"


select * from `e1.employees`

select distinct Department from `e1.employees`

select * from `e1.employees` where Department  = "Operations"

select * from `e1.products`

select * from `e1.products` where SupplierID = "SUP003"

select * from `e1.inventory`

select * from`e1.customers` where SignupDate > "2023-01-01"

select * from `e1.products`

select distinct CategoryID from `e1.products`

select count(distinct CategoryID ) from `e1.products`