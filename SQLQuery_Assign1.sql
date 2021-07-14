use AdventureWorks2019
go

-- Q1
Select ProductID, Name, Color, ListPrice from Production.Product

-- Q2
Select ProductID, Name, Color, ListPrice 
from Production.Product
where ListPrice = 0

-- Q3
Select ProductID, Name, Color, ListPrice
from Production.Product
where Color is Null

-- Q4
Select ProductID, Name, Color, ListPrice
from Production.Product
where Color is not Null

-- Q5
Select ProductID, Name, Color, ListPrice
from Production.Product
where Color is not Null and ListPrice > 0

-- Q6
Select Name + ' ' + Color as "Name and Color"
from Production.Product
where Color is not Null

-- Q7
Select 'NAME: ' + Name + ' -- ' + 'COLOR: ' + Color as "Name And Color"
from Production.Product
where color is not Null

-- Q8
Select ProductID, Name
from Production.Product
where ProductID between 400 and 500

-- Q9
Select ProductID, Name, Color
from Production.Product
where Color = 'black' or Color = 'blue'

-- Q10
Select *
from Production.Product
where Name like 'S%'

-- Q11
Select Name, ListPrice
from Production.Product
where Name like 'S%'
order by Name

-- Q12
Select Name, ListPrice
from Production.Product
where Name like '[A,S]%'
order by Name

-- Q13
Select Name
from Production.Product
where Name like 'SPO%' and Name not like 'SPOK%'
order by Name

-- Q14
Select Distinct Color
from Production.Product
order by Color DESC

-- Q15
Select Distinct CAST(ProductSubcategoryID as varchar) + ' ' + Color as "Combination"
from Production.Product
where ProductSubcategoryID is not Null and Color is not Null
order by Combination

-- Q16
SELECT ProductSubCategoryID
      , LEFT([Name],35) AS [Name]
      , Color, ListPrice 
FROM Production.Product
WHERE Color NOT IN ('Red','Black') 
      OR ListPrice BETWEEN 1000 AND 2000 
      AND ProductSubCategoryID = 1
ORDER BY ProductID


-- Q17
Select ProductSubCategoryID, Name, Color, ListPrice
from Production.Product
where 
	ProductSubcategoryID = 1 and ListPrice = 539.99 or
	ProductSubcategoryID = 2 and ListPrice = 1700.99 or
	ProductSubcategoryID = 12 and ListPrice = 1364.5 or
	ProductSubcategoryID = 14 and ListPrice = 1431.5
order by ProductSubcategoryID desc