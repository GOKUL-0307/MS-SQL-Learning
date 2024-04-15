use HMBank;


--task 3
select * from Customers;
select * from Transactions;
select * from Accounts;

--1
SELECT AVG(balance) AS Avg_Acc_Balance
From Accounts;

--2

SELECT TOP 10 * 
FROM Accounts
ORDER BY balance DESC;

--3

SELECT SUM(Amount) AS "Total_Deposits"
FROM Transactions
WHERE transaction_type = 'deposit' AND transaction_date = '2024-04-12';

--4

SELECT MIN(DOB) AS Old_Customer,MAX(DOB) AS New_Customer
FROM Customers;

--5

SELECT t.*,a.account_type
FROM  Transactions t
JOIN Accounts a ON t.account_id = a.account_id;


--6


SELECT c.Customer_id,c.first_name,c.last_name,a.account_id,a.account_type,a.balance
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id;

--7

SELECT t.*,c.customer_id,c.first_name,c.last_name
FROM Transactions t
JOIN Accounts a ON a.account_id  = t.account_id
JOIN Customers c ON a.customer_id = c.customer_id
WHERE t.account_id = 109;

--8

SELECT c.customer_id,c.first_name,c.last_name,COUNT(a.account_id) AS num_accounts
FROM  Accounts a
JOIN Customers c ON c.customer_id = a.customer_id
GROUP BY c.customer_id,c.first_name,c.last_name
HAVING COUNT(a.account_id)>1


--OR--

SELECT customer_id,COUNT(account_id) AS num_accounts
FROM Accounts
GROUP BY customer_id
HAVING COUNT(account_id) > 1;

--9
SELECT 
    account_id,
    SUM(CASE WHEN transaction_type = 'deposit' THEN amount ELSE -amount END) AS transaction_difference
FROM 
    Transactions
GROUP BY 
    account_id;

--or

SELECT 
    account_id,
    SUM(amount * CASE WHEN transaction_type = 'deposit' THEN 1 ELSE -1 END) AS transaction_difference
FROM 
    Transactions
GROUP BY 
    account_id;

--10

SELECT account_id,AVG(balance) AS Avg_Daily_Balance
FROM  Accounts
GROUP BY account_id;

--11

SELECT account_type,SUM(balance) AS Total_Balance
FROM Accounts
GROUP BY account_type;

--12

SELECT account_id,COUNT(account_id) AS No_of_Transactions
FROM Transactions
GROUP BY account_id
ORDER BY No_of_Transactions DESC;


--13

SELECT c.customer_id,c.first_name,c.last_name,SUM(a.balance) AS total_balance,a.account_type
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, a.account_type
ORDER BY total_balance DESC;

--14

SELECT account_id,transaction_type,amount,transaction_date,COUNT(*) AS duplicate_count
FROM Transactions
GROUP BY account_id, transaction_type, amount, transaction_date
HAVING COUNT(*) > 1;


