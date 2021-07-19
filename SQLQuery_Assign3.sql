-- PartI
-- 1. use joins because joins will be executed faster
-- 2. CTE aims to simplify various classes of SQL queries for which a derived table was unsuitable
-- 3. table variable is a special type of the local variable that helps to store data temporarily
-- 4. TRUNCATE always removes all the rows from a table, and leaves the table empty and the table structure intact
--    but DELETE may remove conditionally if the where clasue is used
-- 5. identity column is a column whose value increases automatically, the value is created by the server,
--    it can be used to uniquely identify the rows in the table.
--    DELETE removes rows one at a time and retains the identity and does not reset it to the seed value
--    TRUNCATE reset the identity to its seed value. 
-- 6. delete from table_name will remove all records from a Where clause along with the identity values
--    truncate table table_name will remoove all rows of the table, and the identity values will be reset


use Northwind
-- Part II
-- Q1:
select distinct city from Customers
where city in (select distinct city from Employees)

-- Q2:
-- a.
select distinct city from Customers
where city not in (select distinct city from Employees)
-- b.

-- Q3:
select orderid, productid, quantity from [Order Details]
where orderid in (select orderid from orders)

-- Q4:
--select sum(quantity) from [Order Details]
select c.city, (select orderid, 
(select od.quantity from [Order Details] od where od.OrderID = o.OrderID) 
from orders o) as "totalquantities" from customers c
--select city, customerid from customers where 
--customerid in (select customerid from orders)

-- Q5:
-- a.
select c.city, c.customerid from customers c
union
select o.shipcity, count(o.customerid) from orders o
group by o.ShipCity
having count(o.CustomerID) > 1

-- b.
select c.city, dt.NumCustomer from Customers c inner join
(select CustomerID, count(customerid) as "NumCustomer" from orders group by customerid
having count(customerid) > 1) dt
on c.customerid = dt.CustomerID

-- Q6:
select c.city, count(distinct dt.productid) as "kindsofproducts" from customers c inner join
(select o.shipcity, od.productid, o.CustomerID from [Order Details] od inner join Orders o
on od.OrderID = o.OrderID) dt
on c.customerid = dt.customerid
group by c.city

-- Q7:
select dt.customerid, dt.contactname, o.shipcity from orders o inner join
(select customerid, contactname, city from customers
where customerid in (select distinct customerid from orders)) dt
on o.shipcity != dt.city

-- Q8:
select orderid, productid, quantity from [Order Details]
order by quantity desc
select * from
(select od.productid, od.quantity, dense_rank() over(order by od.quantity desc) rnk
from [Order Details] od inner join products p on od.ProductID = p.ProductID) dt
where dt.rnk <= 5

-- Q9:
select city from Employees where city in 
(select city from customers
where not CustomerID in (select CustomerID from Orders))

-- 10:


-- 11.
-- Insert the distinct rows from the duplicate rows table to new temporary table

