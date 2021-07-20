-- Assignment #4

-- Part I:
-- 1. A view is a virtual table whose contents are defined by a query. Views can simplify how users work with data, 
--    and enable to create a backward compatible interface for a table when its schema changes.
-- 2. Yes, but subject to a few restrictions
-- 3. A stored procedure groups one or more Transact-SQL statements into a logical unit, stored as an object in SQL Server database,
--    it can increase database security by limiting direct access, and it enables faster execution.
-- 4. View is just showcasing data stored in the database tables whereas a stored procedure is a group of statements that can be executed.
-- 5. The function must reture a value but it is optional for stored procedure. Function can be only used in a SQL statement, mostly in a select statement, or representing a data or a dataset.
-- 6. Yes
-- 7. Yes, since it can return one or multiple result sets.
-- 8. Trigger is a special type of stored procedure that get executed when a specific event happens.
-- 9. Enforce integrity beyond simple referential integrity, implement business rules, maintain audit record of changes, accomplish cascading updates and deletes.
-- 10. Trigger is a stored procedure that automatically runs when various events happen. But stored procedures can be invoked explicitly by the user.


-- Part II:
-- Q1:
select * from region
select * from Territories
insert into Region values (5, 'Middle Earth')
insert into Territories values (08817, 'Gondor', 5)

-- Q2:
update Territories set TerritoryDescription = 'Arnor' where TerritoryID = 80017

-- Q3:
delete from region where RegionDescription = 'Middle Earth'

-- Q4:
create view view_product_order_Yu
as
select p.ProductName, p.ProductID, sum(od.Quantity) as "totalQty"
from Products p inner join [Order Details] od
on p.ProductID = od.ProductID
group by p.ProductName, p.ProductID

select * from view_product_order_Yu

-- Q5:
create proc sp_product_order_quantity_Yu
@productid int,
@qty int out
as
begin
	select @qty = totalQty from view_product_order_Yu where ProductID = @productid
end

declare @en int -- declare (create) a variable
execute sp_product_order_quantity_Yu 3, @en out
print @en

-- Q6:
create proc sp_product_order_city_Yu
@productName varchar(20),
@top5cities varchar(20) out,
@totalQty int out
as
begin
	
end