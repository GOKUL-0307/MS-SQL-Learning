-- 1. Create the database named "HMBank"
CREATE DATABASE HMBank;

-- 2. Use the HMBank database
USE HMBank;

-- 3. Define the schema for the Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    DOB DATE,
    email VARCHAR(100),
    phone_number VARCHAR(15),
    address VARCHAR(255)
);

-- 4. Define the schema for the Accounts table
CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(100),
    balance DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 5. Define the schema for the Transactions table
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_type VARCHAR(50),
    amount DECIMAL(10, 2),
    transaction_date DATE,
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);


