select * 
from `e1.customers` 
limit 5 -- Show the names of all the customers 
select Name 
from `e1.customers` -- Show customer cities. 
select City 
from `e1.customers` 
Finance wants only payment methods. 
select * 
from `e1.payments` 
limit 5 
select Method 
from `e1.payments` 
HR wants employee names. 
select * 
from `e1.employees` 
limit 5 
select name 
from `e1.employees` 
Alter table `e1.employees` 
rename column string_field_0 to EmployeeID 
Summary Notes
Earners AI and ML by Aditya Jain sir - Lecture 26
 
 
Alter table `e1.employees` 
rename column string_field_1 to Name 
 
 
 
Alter table `e1.employees` 
rename column string_field_2 to Department 
 
 
delete from `e1.employees` 
where EmployeeID = "EmployeeID" 
 
 
select * 
from `e1.products` 
 
 
select * from `e1.products` 
 
 
select 
  ProductID, 
  ProductName 
from `e1.products` 
 
 
 
select 
  ProductName, 
  ProductID 
from `e1.products` 
 
 
select 
  ProductID, 
  ProductName, 
  CategoryID 
from `e1.products` 
 
 
 
customers 
 
FROM 
 
customer_name 
 
SELECT 
 
 
select customer_name 
from customers 
 
 
 
products 
 
SELECT 
 
selling_price 
 
FROM 
 
 
select selling_price 
from products 
 
 
select city 
from `e1.customers` 
 
 
select distinct City 
from `e1.customers` 
 
 
 
Different payment methods. 
 
select distinct method 
from `e1.payments` 
 
 
 
Different states 
 
select * 
from `e1.suppliers` 
 
select distinct state 
from `e1.suppliers` 
 
 
alter table `e1.suppliers` 
rename column string_field_0 to SupplierID 
 
alter table `e1.suppliers` 
rename column string_field_1 to SupplierName 
 
alter table `e1.suppliers` 
rename column string_field_2 to State 
 
 
select * 
from `e1.orders` 
 
 
select * 
from `e1.payments` 
 
 
how many distinct amounts do we have in this table? 
 
 
select distinct amount 
from `e1.payments` 
 
 
 
select * 
from `e1.customers` 
 
 
 -- on which dates there has been atleast 1 customer who signed up 
 
select distinct SignupDate 
from `e1.customers` 
 
 
 
 
select distinct age, city 
from `e1.customers` 
 
 
what are the unique combinations of payment methods and payment status 
 
 
select * 
from `e1.payments` 
 
select distinct method, status 
from `e1.payments` 
