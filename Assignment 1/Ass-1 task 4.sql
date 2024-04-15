use TechShop;
--task 4

select * from Customers;
select * from Orders;
select * from OrderDetails;
select * from Products;
select * from Inventory;
select * from Category;

--1
select * from Customers
where CustomerID not in (select CustomerID from Orders);

--2
select sum(QuantityInStock) as "Products Available" from Inventory;

--3
select sum(TotalAmount) as "Revenue Generated" from Orders;

--4
declare @Categoryname Varchar(30);
set @Categoryname='Entertainment';

select avg(Quantity) as "Average Quantity"  from OrderDetails
where ProductID in 
(select p.ProductId from Products p 
join Category c on c.Category_Id=p.Category_Id 
where c.Category= @Categoryname);

--5
declare @custid int;
set @custid=10;
select CustomerId,sum(TotalAmount) as "Revenue Generated" from Orders
where customerId=@custid
group by CustomerID;

--6
SELECT 
    c.CustomerID,
    c.FirstName,
    (
        SELECT COUNT(OrderID) 
        FROM Orders o
        WHERE o.CustomerID = c.CustomerID
        GROUP BY o.CustomerID
    ) AS "Orders Placed"
FROM Customers c
ORDER BY "Orders Placed" DESC;

--7
SELECT TOP 1
    c.Category,
    (
        SELECT SUM(od.Quantity) 
        FROM OrderDetails od
        JOIN Products p ON od.ProductID = p.ProductID
        JOIN Category e ON p.Category_Id = e.Category_Id
        WHERE e.Category = c.Category
        GROUP BY e.Category_Id
    ) AS "Popular"
FROM Category c
ORDER BY "Popular" desc;

--8
SELECT TOP 5
    c.CustomerId,
    c.FirstName,
    (
        SELECT SUM(o.TotalAmount) 
        FROM Orders o
        JOIN OrderDetails od ON o.OrderID = od.OrderID
        JOIN Products p ON od.ProductID = p.ProductID
        JOIN Category ce ON p.Category_Id = ce.Category_Id
        WHERE ce.Category = 'Electronics' AND o.CustomerId = c.CustomerId
    ) AS "Amount Spent"
FROM Customers c
ORDER BY "Amount Spent" DESC;

--9

SELECT 
    AVG(TotalAmount) AS "Average Order Value"
FROM Orders;

--or 

select c.CustomerId ,c.FirstName,(SELECT 
    AVG(o.TotalAmount) FROM Orders o
where c.CustomerId=o.CustomerID
group by o.CustomerID) as "Average Value"
from Customers c;

--10
select c.CustomerId,c.FirstName,(select count(o.OrderID) from Orders o
where c.CustomerId=o.CustomerID
Group by o.CustomerID) as "Orders Placed"
from Customers c;