use TechShop;
-- task 3
select * from Customers;
select * from Orders;
select * from OrderDetails;
select * from Products;
select * from Inventory;
select * from Category;
--1

SELECT CONCAT(c.FirstName,' ', c.LastName) AS "Names", c.CustomerID, c.Email, o.OrderID, o.OrderDate,o.TotalAmount
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName, c.Email, o.OrderID, o.OrderDate,o.TotalAmount
Order by c.CustomerID;


--2
SELECT  p.ProductID, p.ProductName, SUM(od.Quantity * p.Price) AS Revenue
FROM Products p
INNER JOIN OrderDetails od 
ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName;


--3
select Customers.*
from Customers
join Orders
on Customers.CustomerID=Orders.CustomerID
Group By Customers.CustomerID,Customers.Email,Customers.FirstName,Customers.LastName,Customers.Phone,Customers.Address
having count(Orders.OrderID)>=1;

--4


SELECT TOP 1 p.ProductID, p.ProductName, SUM(od.Quantity) as Quantity
FROM Products p
INNER JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY SUM(od.Quantity) DESC;


--5
select ProductName,Description as Category
from Products;
ALTER TABLE Products
ADD Category_Id INT REFERENCES Category(Category_Id);


select p.ProductId,p.ProductName,p.Description,p.Price,c.Category 
from Products p
join Category c
on p.Category_Id=c.Category_Id
group by c.Category,p.ProductID,p.ProductName,p.Description,p.Price
order by c.Category;


--6

SELECT CONCAT(c.FirstName,' ',c.LastName) AS Names, AVG(o.Totalamount) AS AverageValue
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY CONCAT(c.FirstName,' ',c.LastName);


--7
SELECT TOP 1 o.OrderID, c.FirstName, c.LastName, o.TotalAmount AS TotalRevenue
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
ORDER BY o.TotalAmount DESC;

--8
SELECT p.ProductName, COUNT(od.OrderDetailID) AS OrderCount
FROM Products p
LEFT JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName;

--9
declare @ProductName varchar(50);
set @ProductName='iPad Pro';
select c.CustomerId,CONCAT (c.FirstName,' ',c.LastName) as "Names",o.OrderID
from Customers c
join Orders o on c.CustomerID=o.CustomerID
join OrderDetails od on od.OrderID=o.OrderID
join Products p on p.ProductID=od.ProductID
where p.ProductName=@ProductName;

--10
declare @StartDate date;
declare @EndDate date;
set @StartDate='2023-05-01';
set @EndDate='2024-02-01';
select sum(TotalAmount) as Revenue 
from Orders
where OrderDate between @StartDate and @EndDate;



select * from Customers;
select * from Orders;
select * from OrderDetails;
select * from Products;





