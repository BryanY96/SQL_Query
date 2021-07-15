use AdventureWorks2019
go
-- Part I
-- Q1: a result set is the result after using joins to connect column or columns from one table to another table
-- Q2: Union extracts the records that are being specified in the query, but Union All extracts all the records including the duplicates
-- Q3: INTERSECT, EXCEPT
-- Q4: Union is used to combine the result set of two of more SELECT statements, but Join combines data from many tables based on a matched condition
-- Q5: Inner join only return records that have matching values in both tables, Full join returns all records from both tables
-- Q6: Left join returns all records from left table, and the matched records from right table, Outer join returns all records from both tables
-- Q7: Cross join produces a result set which is the number of rows in the first table multiplied by the number of rows in the second table
-- Q8: WHERE clause can not be used with aggregate function but HAVING clause can
-- Q9: Yes

-- Part II
-- Q1:
select count(productID) from Production.Product

-- Q2
select count(productID)
from Production.Product
where ProductSubcategoryID is not null

-- Q3
select ProductSubcategoryID, count(ProductID) as CountedProducts
from Production.Product
group by ProductSubcategoryID

-- Q4
select count(productID) from Production.Product
where ProductSubcategoryID is null

-- Q5
select productID, quantity
from Production.ProductInventory

-- Q6
select productID, quantity as "TheSum"
from Production.ProductInventory
where LocationID = 40 and Quantity < 100

-- Q7
select shelf, productID, quantity as "TheSum"
from Production.ProductInventory
where LocationID = 40 and Quantity < 100

-- Q8
select avg(quantity)
from Production.ProductInventory
where LocationID = 10

-- Q9
select productID, Shelf, avg(quantity) as "TheAvg"
from Production.ProductInventory
group by Shelf, ProductID

-- Q10
select productID, Shelf, avg(quantity) as "TheAvg"
from Production.ProductInventory
where Shelf != 'N/A'
group by Shelf, ProductID

-- Q11
select color, class, count(productID) as "TheCount", avg(listprice) as "AvgPrice"
from Production.Product
where color is not null and class is not null
group by color, class

-- Q12
select c.Name as "Country", s.Name as "Province"
from Person.CountryRegion c inner join Person.StateProvince s
on c.ModifiedDate = s.ModifiedDate

-- Q13
select c.Name as "Country", s.Name as "Province"
from Person.CountryRegion c inner join Person.StateProvince s
on c.ModifiedDate = s.ModifiedDate
where c.Name = 'Germany' or c.Name = 'Canada'

-----
use Northwind
go
-- Q14
select * from Orders
-- select orderID, CustomerID, DATEDIFF(d, OrderDate, ShippedDate) from Orders
select orderID, CustomerID, OrderDate
from Orders
where OrderDate between '1996-07-15' and '2021-07-15'

-- Q15
select * from [Order Details]
select top 5 o.shipPostalCode as "Zip Code"
from Orders o inner join [Order Details] od 
on od.OrderID = o.OrderID
order by od.quantity desc

-- Q16
select top 5 o.shipPostalCode as "Zip Code"
from Orders o inner join [Order Details] od 
on od.OrderID = o.OrderID
where o.OrderDate between '2001-07-15' and '2021-07-15'
order by od.quantity desc

-- Q17
select ShipCity, count(customerID) as "NumCustomer"
from Orders
group by ShipCity

-- Q18
select ShipCity, count(customerID) as "NumCustomer"
from Orders
group by ShipCity
having count(customerID) > 10

-- Q19
select c.ContactName as "Customer Name", o.OrderDate
from Customers c inner join Orders o
on c.CustomerID = o.CustomerID
where o.OrderDate > '1998-01-01'

-- Q20
select c.ContactName as "Customer Name", max(o.OrderDate)
from Customers c inner join Orders o
on c.CustomerID = o.CustomerID
group by c.ContactName

-- Q21
select c.ContactName as "Customer Name", od.Quantity
from Customers c inner join Orders o
on c.CustomerID = o.CustomerID
inner join [Order Details] od
on o.OrderID = od.OrderID

-- Q22
select o.CustomerID, od.Quantity
from [Order Details] od inner join Orders o
on od.OrderID = o.OrderID
where od.Quantity > 100

-- Q23
select su.CompanyName as "Supplier Company Name", sh.CompanyName as "Shipping Company Name"
from Suppliers su, Shippers sh

-- Q24
select o.OrderDate as "Date", p.ProductName as "Product Name"
from [Order Details] od inner join Orders o
on od.OrderID = o.OrderID
inner join Products p
on od.ProductID = p.ProductID

-- Q25
--select * from Employees
select p1.FirstName as "employee1", p2.FirstName as "employee2", p1.Title
from Employees p1 inner join Employees p2
on p1.Title = p2.Title

-- Q26
select m.FirstName as "Manager"
from Employees e left join Employees m
on e.ReportsTo = m.EmployeeID

-- Q27


-- Q28
select t1.num
from T1 t1 inner join T2 t2
on t1.num = t2.num
-- result: 2 3

-- Q29
select t1.num
from T1 t1 left join T2 t2
on t1.num = t2.num
-- result: 1 2 3


