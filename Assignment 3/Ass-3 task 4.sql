use HMBank;

--task 4
select * from Customers;
select * from Transactions;
select * from Accounts;

--1

SELECT c.customer_id,c.first_name,c.last_name,
(select max(balance) from Accounts) as "Balance"
FROM Customers c
WHERE c.customer_id = (SELECT TOP 1 a.customer_id FROM Accounts a ORDER BY balance DESC);

--2

SELECT AVG(balance) AS average_balance
FROM Accounts
WHERE customer_id IN (SELECT customer_id FROM Accounts GROUP BY customer_id HAVING COUNT(*) > 1);

--3

SELECT *
FROM Accounts
WHERE account_id IN (
    SELECT account_id 
    FROM Transactions 
    WHERE Amount > (SELECT AVG(Amount) FROM Transactions)
);

--4

SELECT customer_id,first_name,last_name FROM Customers
WHERE customer_id NOT IN (
    SELECT DISTINCT customer_id 
    FROM Accounts 
    WHERE account_id IN (
        SELECT DISTINCT account_id 
        FROM Transactions
    )
);
--5

SELECT SUM(balance) AS Total_balance
FROM Accounts
WHERE account_id NOT IN (SELECT DISTINCT account_id FROM Transactions);

--6

SELECT t.*
FROM Transactions t
WHERE t.account_id IN
(SELECT account_id FROM Accounts WHERE balance = (SELECT MIN(balance) FROM Accounts));


--7
SELECT c.customer_id,c.first_name,c.last_name
FROM Customers c
WHERE c.customer_id IN (SELECT a.customer_id FROM Accounts a GROUP BY a.customer_id HAVING COUNT(DISTINCT a.account_type) > 1);

--8

SELECT account_type,COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Accounts) AS percentage
FROM Accounts
GROUP BY account_type;

--9

DECLARE @customer_id INT;
SET @customer_id = 13
SELECT *
FROM Transactions
WHERE account_id IN (SELECT account_id FROM Accounts WHERE customer_id = @customer_id);

--10

SELECT account_type,
(SELECT SUM(balance) FROM Accounts WHERE account_type = a.account_type) AS "Total_balance"
FROM (SELECT DISTINCT account_type FROM Accounts) AS a;






