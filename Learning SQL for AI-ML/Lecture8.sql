select Method , sum(Amount) as total_payment from `e1.payments` 
group by Method 
order by total_payment desc

select Name , Age,   City from `e1.customers`
order by  City asc , age desc


select SupplierID , 
count(*) as no_of_products , 
avg(SellingPrice) as AVG_SP
from `e1.products`
group by SupplierID
order by no_of_products desc, AVG_SP  desc


select 
count(*) as Prod_CNT
from `e1.products`
 where MRP > 10000
group by SupplierID


select 
ProductID , CategoryID, SellingPrice
from `e1.products`
order by CategoryID, SellingPrice desc



select 
ProductID
from `e1.products`
where MRP > 20000

select SupplierID, 
count(*)  as Product_Count from `e1.products`
group by SupplierID
having Product_Count > 3


select CustomerID, 
count(*)  as No_orders from `e1.orders`
group by CustomerID
having No_orders > 5


select SupplierID, 
count(*)  as Product_Count from `e1.products`
group by SupplierID
having Product_Count <= 5

select ProductID, 
sum(Total) as T_SALES
 from `e1.order_items`
group by ProductID
having T_SALES > 50000


Select SupplierID ,
 count(*)  as Product_Count 
from `e1.products`
where MRP > 1000
group by SupplierID
having  Product_Count > 2
order by Product_Count desc
limit 5



















