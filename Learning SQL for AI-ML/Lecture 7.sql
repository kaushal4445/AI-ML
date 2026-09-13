    -- Order by


-- select ProductID, SellingPrice
--  from `e1.products`
--  order by SellingPrice asc
--  limit 10

-- select *
--  from `e1.products`
--  order by ProductName asc
 

-- select *from  `e1.customers`
-- order by age asc

-- select * from `e1.inventory` 
-- order by Stock asc


-- select *  from `e1.payments` 
-- order by Amount desc
-- limit 5

-- select * from `e1.order_items`
-- order by Total desc


-- select * from `e1.reviews`
-- order by Rating desc


-- select *
-- from `e1.products`
-- where MRP > 500
-- order by MRP desc

-- select  SupplierID,
-- count(*)  as catalog_size
-- from `e1.products`
-- group by SupplierID
-- order by catalog_size



-- select 
-- ProductID,
-- sum(Total) as Total_sALES
-- from `e1.order_items`
-- group by  ProductID
-- order by Total_sAles desc
-- limit 5


select * 
from `e1.products`
order by CategoryID asc, SellingPrice desc


