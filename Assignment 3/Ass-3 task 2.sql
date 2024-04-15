use HMBank;


--task 2
select * from Customers;
select * from Transactions;
select * from Accounts;

--1

SELECT CONCAT(c.First_Name,' ',c.Last_Name) AS "Name",a.account_type,c.email
From Customers c
JOIN Accounts a ON c.Customer_id = a.Customer_id;

--2

SELECT CONCAT(c.First_Name,' ',c.Last_Name) AS "Name",t.transaction_id, t.transaction_type, t.amount, t.transaction_date
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
JOIN Transactions t ON a.account_id = t.account_id;

--3
DECLARE @Amount INT;
SET @Amount = 2500;
DECLARE @AccountId INT;
SET @AccountId = 107;
UPDATE Accounts
SET balance = balance + @Amount
WHERE account_id = @AccountId;


--4

SELECT CONCAT(first_name,'',last_name) AS Full_Name FROM Customers;

--5

DELETE FROM Accounts
WHERE balance = 0 AND account_type = 'savings';

--6


SELECT * FROM Customers
WHERE city = 'Chennai';

--7
DECLARE @AccountId INT;
SET @AccountId = 105;
SELECT balance
FROM Accounts
WHERE account_id = @AccountId;

--8

SELECT * 
FROM Accounts
WHERE account_type = 'current' AND balance > 1000;

--9

DECLARE @Account_id INT;
SET @Account_id = 107;
SELECT * FROM Transactions
WHERE account_id = @Account_id;

--10
DECLARE @Interest_Rate INT;
SET @Interest_Rate = 5;
SELECT account_id, balance* ( @Interest_Rate /100.0) As  Interest_Amt
FROM Accounts
WHERE account_type = 'savings'

--11

DECLARE @OverDraftLimit INT;
SET @OverDraftLimit  = 200000;
SELECT account_id, balance
FROM Accounts
WHERE balance < @OverDraftLimit;

--12

SELECT * FROM Customers
WHERE city NOT LIKE 'Mumbai';
