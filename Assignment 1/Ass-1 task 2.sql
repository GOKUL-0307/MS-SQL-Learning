use TechShop;
select * from Customers;
select * from Orders;
select * from OrderDetails;
select * from Products;
select * from Inventory;
--task 2

--1
select 
concat (FirstName,' ',LastName) as "Names",Email 
from Customers;

--2
SELECT o.OrderID, o.OrderDate, CONCAT(c.FirstName, ' ', c.LastName) AS Names
FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID;

--3
insert into Customers values(45,'Rohit','Sharma','rohit45@gmail.com',7362890476,'005 ipl st  Mumbai');

--4
UPDATE Products
SET Price = Price * 1.10;

--5
declare @InputOrderID int;
set @InputOrderID=1015;
delete Orders
where OrderID=@InputOrderID;
delete OrderDetails
where OrderID=@InputOrderID;

--6
insert into Orders
values(1021,45,'2024-03-18',79800);

--7
declare @InputCustomerID int;
declare @InputEmail varchar(255);
declare @InputAddress varchar(255);
set @InputCustomerID=99;
set @InputEmail='souravganguly@example.com';
set @InputAddress='247 Richi St Delhi';
Update Customers
set 
Email=@InputEmail,
Address=@InputAddress
where CustomerID=@InputCustomerID;

--8
UPDATE Orders
SET TotalAmount = (
    SELECT SUM(p.Price * od.Quantity)
    FROM Products p
    INNER JOIN OrderDetails od ON p.ProductID = od.ProductID
    WHERE od.OrderID = Orders.OrderID
);

--9
declare @IpCustomerID int;
set @IpCustomerID=333;
delete OrderDetails
where OrderID in (select OrderID from Orders where CustomerID=@IpCustomerID);
delete Orders
where CustomerID=@IpCustomerID;


--10
insert into Products values(2511,'Raspberry Pi','Mini Computer',70000);

-- 11
alter table Orders
add Status varchar(30;
UPDATE Orders
SET Status = 'Pending';
declare @OrderId int;
declare @Status Varchar(30);
set @OrderId=1011;
set @Status='Shipped';
Update Orders
set Status=@Status
where OrderID=@OrderId;



--12

SELECT 
    Customers.CustomerID,
    CONCAT(Customers.FirstName, ' ', Customers.LastName) AS FullName,
    COUNT(o.OrderId) AS OrdersPlaced
FROM 
    Orders o
JOIN 
    Customers ON o.CustomerID = Customers.CustomerID
GROUP BY 
    Customers.CustomerID, CONCAT(Customers.FirstName, ' ', Customers.LastName);

