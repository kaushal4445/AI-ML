--find suppliers whose number of products is grater than the averga enumber of products supplied per supplier

-- select  SupplierID,
-- count(*) as no_ofproducts
-- from `e1.products`
-- group by SupplierID

-- select avg(no_of_products) from (select SupplierID, count(*) as no_of_products
--  from `e1.products` 
-- group by SupplierID)

-- select SupplierID , count(*) as no_prds from
-- `e1.products`
-- group  by SupplierID
-- having count(*) > (select avg(no_of_products)
-- from (select SupplierID, 
-- count(*) as no_of_products
--  from `e1.products` 
-- group by SupplierID))


  -------------------------------JOINS---------------------------------------------------


--products -- Product NName
-- LInkage categoryID

---Category -- category Name


--tablename.columnname

--Syntax:

-- Select from table1 join table2 on table.key == table2.key



  --Show mw the product name and the category name.

-- alter table`e1.categories` rename column string_field_0 to CategoryID

-- alter table`e1.categories` rename column string_field_1 to CategoryName


-------------------------INNER JOIN-------------------------------------------------


-- select 
-- p.ProductName,p.ProductID, 
-- c.CategoryName, c.CategoryID
-- from `e1.products` as p
-- inner join `e1.categories` as c
-- on  p.CategoryID = c.CategoryID


-- select 
-- p.ProductName as PRODUCTS
-- from `e1.products` as p
-- inner join `e1.categories` as c
-- on c.CategoryName = "Electronics"

-- select 
-- p.ProductName,p.ProductID, 
-- c.CategoryID,
-- c.CategoryName, 
-- from `e1.categories` as c
-- inner join`e1.products` as p
-- on  p.CategoryID = c.CategoryID
-- where c.CategoryName ="Electronics"

--Display products with their category name, sorted by MRP from highest to lowest

-- select 
-- p.ProductName, 
-- c.CategoryName,
-- c.CategoryID, 
-- p.MRP
-- from `e1.products` as p
-- inner join `e1.categories` as c
-- on  p.CategoryID = c.CategoryID
-- order by p.MRP desc


--Display ProductName, Categories , CategoryName and discount amount


-- select p.ProductName, 
-- c.CategoryName,
-- p.MRP - p.SellingPrice as DISCOUNT
-- from `e1.categories` as c
-- inner join `e1.products` as p
-- on  p.CategoryID = c.CategoryID


--Display each product along with its supplier name and supplier state

-- select p.ProductID,
-- s.SupplierName, 
-- s.State
-- from `e1.suppliers`  as s
-- inner join `e1.products` as p
-- on p.SupplierID = s.SupplierID


---Display all cancelled succesful customer orders along with Cutomer name and city


-- select  o.Status ,
-- c.Name, c.City
-- from `e1.orders` as o
-- inner join `e1.customers` as c
-- on o.CustomerID = c.CustomerID
-- where o.Status = "Cancelled"

---Calculate total sales value for every order


-- select 
-- o.OrderID,
-- sum(oi.Total) as T_SALES
-- from `e1.orders` as o
-- inner join `e1.order_items` as oi
-- on o.OrderID = oi.OrderID
-- group by o.OrderID


 --Calculate total sales genersted by each customer


-- 1.customer  name -> customer
 -- 2. linkage -> table;
 --customerid -> orders + customer
 -- orderid-> orders +order_items
--3. toatl sales ->orders_items


select 
c.CustomerID,
sum(oi.Total) as T_SALES
from `e1.customers` as c
inner join `e1.orders` as o
on c.CustomerID = o.CustomerID
inner join `e1.order_items` as oi
on o.OrderID = oi.OrderID
group by c.CustomerID
order by T_SALES desc


--DPP Questions:

--Product-Wise Sales with ProductNmae

--CategoryName-Wise total sales


-- Calculate total sales generated y products ferom esach supplier
 -- display all products and any order-items sales associated with them


-- find Productsd with No sales



