create database TechShop;



CREATE TABLE Customers(
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255)UNIQUE,
    Phone VARCHAR(20) ,
    Address VARCHAR(50) 
)

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    Description VARCHAR(50),
    Price INT ,
);


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);



CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT REFERENCES Orders(OrderID),
    ProductID INT REFERENCES Products(ProductID),
    Quantity INT,
);

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT REFERENCES Products(ProductID),
    QuantityInStock INT,
    LastStockUpdate DATE,
);


