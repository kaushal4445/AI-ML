select 
Status,
count(*) as no_of_orders,
round(count(*)*100.0/(select count(*) from `e1.orders`), 2) as percentage_of_products
from `e1.orders`
group by Status
order by no_of_orders desc


select count(*) from `e1.orders`

select 
ProductID,
count(*) as order_records,
sum(Quantity) as T_Quantity,
sum(Total) as T_SALES
from `e1.order_items`
group by ProductID
order by T_Quantity desc
limit 5


select 
ProductID,
count(*) as no_of_records,
sum(Quantity) as T_QUANTITY,
sum(Total) as T_SA 
from `e1.order_items`
where Total > 2500
group by ProductID
having   no_of_records >=  3

select 
ProductID ,
min(SellingPrice) as MIN_SP,
max(SellingPrice) as MAX_SP,
avg(SellingPrice) as AVG_SP,
count(*) as Order_item_records
from `e1.order_items`
group by ProductID
having MIN_SP > 1000
order by AVG_SP  desc


select 
WarehouseID,
count(distinct ProductID) as Diff_products,
sum(Stock) as  T_STOCK,
round(avg(Stock),2) as AVG_STOCK
from `e1.inventory`
group by WarehouseID
having Diff_products >= 5
order by T_STOCK desc






select avg(MRP) from `e1.products`


select *  from `e1.products`
where MRP >= (select  avg(MRP) from `e1.products` )

select *  from `e1.products`
where MRP < (select  avg(MRP) from `e1.products` )

select distinct(MRP) from `e1.products` 
order by MRP desc
limit 5




