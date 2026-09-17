select * from `e1.products`

select SupplierID,
count(*) as No_of_products,
avg(MRP) as AVG_MRP,
max(MRP) as MX_MRP
from `e1.products`
group by SupplierID
having No_of_products  >= 3
order by No_of_products desc





Select CategoryID,
count(*)  as no_of_produts,
avg(MRP) as AVG_MRP,
max(MRP) as MX_MRP
from `e1.products`
group by CategoryID
having AVG_MRP > 150
order by AVG_MRP desc

select 
ProductID,
sum(Quantity) as T_Quantitiy,
sum(Total) as T_SALES
from `e1.order_items`
group by ProductID
having  T_Quantitiy >= 10 and  T_SALES > 100000
order by T_SALES desc



select *  from `e1.products`


select 
ProductID,
ProductName,
MRP,
SellingPrice,
(MRP- SellingPrice) as discount_amount
from `e1.products`
where  SellingPrice < MRP
order by   discount_amount desc





select 
ProductID,
ProductName,
MRP,
SellingPrice,
round(((MRP- SellingPrice)/ MRP), 2)*100 as discount_Percentage
from `e1.products`
where  round(((MRP- SellingPrice)/ MRP), 2)*100 >= 10
order by   discount_Percentage desc



select * from  `e1.payments`

select  
Method,
count(*) as no_of_transcaions,
sum(Amount) as T_amount,
round(avg(Amount), 2) as A_amount,
max(Amount) as MAX_amount
from `e1.payments`
where Status = "Success"
group by Method
having T_amount > 100000



select 
CustomerID,
count(*) as no_of_products
from `e1.customers`
group by CustomerID

order by no_of_products desc
limit 10

select 
CustomerID,
count(*) as Order_count
from `e1.orders`
group by CustomerID
having Order_Count between 4 and 8
order by Order_count desc
limit 10

select 
WarehouseID,
sum(Stock) as  T_STOCK,
round(avg(Stock), 2) as AVG_STOCK,
max(Stock) as  high_stock,
min(Stock) as low_Stock
from `e1.inventory`
group by WarehouseID
having T_STOCK > 500
order by T_Stock desc


select  
ProductID,
count(*) as INV_RDS,
max(Stock) as  high_stock,
min(Stock) as low_Stock
from `e1.inventory`
group by ProductID
having low_Stock <20










