-- find the customers who have placed at least 5 orders.

-- Display:

-- CustomerID
-- Customername
-- City
-- Numbe of orders




-- select
-- c.CustomerID,
-- c.Name,
-- c.City,
-- count( distinct o.OrderID) as n_f_o
-- from `e1.customers` as c   
-- inner join  `e1.orders`  as    o 
-- on o.CustomerID =c.CustomerID
-- group by c.CustomerID,
-- c.Name,
-- c.City
-- having n_f_o >= 5






-- for every customer, number their orders chronologically:

-- Display:
-- customerid
-- orderid
-- orderdate
-- ordernumber

-- for example:
-- Order o001 -->  1
-- Order  O005 -> 2
-- ORDER O010 -> 3


-- select
-- CustomerID,
-- OrderDate,
-- OrderID,
-- row_number() over(partition by CustomerID order by OrderDate, OrderID  ) as ORDER_NO
-- from `e1.orders`
-- order by CustomerID, ORDER_NO






-- find the number of orders placed on Sataurdy and Day
-- .

-- Display:

-- DAYNAME
-- NUMBER OF ORDERS



-- select 
-- format_date('%A', DATE '2026-10-02')




-- select
-- extract(DAYOFWEEK from DATE '2026-10-02')







-- select
-- format_date('%A', OrderDate) as day_name,
-- count(*) as order_count
-- from `e1.orders`
-- group by day_name
-- order by order_count desc





-- select
-- format_date('%A', OrderDate) as day_name,
-- count(*) as order_count
-- from `e1.orders`
-- where  extract(DAYOFWEEK from OrderDate) in (1, 7)
-- group by day_name
-- order by order_count desc





-- classify every order as:


-- Weekend 
-- Weekday

-- then count the orders in each group


-- select
-- case 
--  when extract(DAYOFWEEK from OrderDate) in (1, 7) then "Weekend"
--  else "Weekday"
--  end as Day_type,
--  count(*) as  order_count
-- from `e1.orders`
-- group by day_type






-- find how many customers signed upin each calender month, irrespective of the year
-- for example , combine all januaury signoup together





-- select
--  extract(MONTH from signupdate) as signup_month,
--  format_date('%B', signupdate) as month_name,
--  count(*) as customers_count
-- from `e1.customers`
-- group by signup_month, month_name






-- classify eveery order as :
-- First half -> january to june
-- second Half -> julu to deceemn=mber

-- then coutn ordes





-- select 
-- case 
--   when extract(MONTH from orderDate) <= 6 then "FIRSTHALF"
--   else "Seconfhalf"
--   end as YEAR_TYPE,
--   count(*) as num_of_orders
-- from `e1.orders`
-- group by YEAR_TYPE





-- calculate total sales for orders placed in first half and second half of the year





-- select 
-- case 
--   when extract(MONTH from orderDate) <= 6 then "FIRSTHALF"
--   else "Seconfhalf"
--   end as YEAR_TYPE,
-- sum(oi.Total) as t_s
-- from `e1.orders` as  o    
-- inner join `e1.order_items` as oi   
-- on oi.OrderID = o.OrderID
-- group by YEAR_TYPE
-- order by t_s  desc







-- Find which day of week has the number of customer signups.





-- select 
-- extract(DAYOFWEEK from signupdate) as day_num,
-- format_date("%A", signupdate) as day_name,
-- count(*) as no_of_signup
-- from `e1.customers`
-- group by day_num, day_name
-- order by no_of_signup desc






-- find how many orders were placesd during thhe first seven days of each month





-- select
-- date_trunc(OrderDate, MONTH) AS o_m,
-- count(*) as n_f_o
-- from `e1.orders`
-- where extract(DAY from OrderDate) <= 7
-- group by o_m



-- select
-- date_trunc(OrderDate, MONTH) AS o_m,
-- format_date("%B", OrderDate)   as m_n,
-- count(*) as n_f_o
-- from `e1.orders`
-- where extract(DAY from OrderDate) <= 7
-- group by o_m, m_n






-- find customers who placed their first order in the same calendar mnth and year  in which they signup



with first_orders as (
  select
  CustomerID,
  min(orderdate) as f_o_d
  from `e1.orders`
  group by CustomerID
)






