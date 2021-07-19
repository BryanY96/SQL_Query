-- Q1:
-- find top 3 products from every city with maximum sale
select * from [Order Details] where productid = 11
select * from [Order Details] where orderid = 10248
select * from orders

select * from
(select o.orderid, o.shipcity, dt.ProductID, dt.totalsales,
DENSE_RANK() over(partition by o.shipcity order by dt.totalsales desc) rnk from orders o
inner join
(select productid, sum(quantity) "totalsales", OrderID from [Order Details] group by ProductID, OrderID) dt
on dt.orderid = o.OrderID) dt2
--where dt2.shipcity = 'Reims'
where dt2.rnk <= 3

-- Q2:
create table #desdis(des varchar(10), dis int)
insert into #desdis values ('A', 0), ('B', 20), ('C', 50), ('D', 70), ('E', 85)
select * from #desdis

with desdisCTE
as
(
select des, 0 dis
from #desdis where dis = 0
union all
select t.des + '-' + ct.des, t.dis - ct.dis
from #desdis t inner join desdisCTE ct on
t.dis = ct.dis
)
select * from desdisCTE