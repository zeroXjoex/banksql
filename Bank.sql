{\rtf1\ansi\ansicpg1252\cocoartf2709
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww28600\viewh15140\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 CREATE TABLE Customers (\
    customer_id INTEGER PRIMARY KEY,\
    name TEXT,\
    email TEXT,\
    phone TEXT\
);\
\
CREATE TABLE Accounts (\
    account_number INTEGER PRIMARY KEY,\
    balance NUMERIC\
);\
CREATE TABLE Transactions (\
    transaction_id INTEGER PRIMARY KEY,\
    transaction_date DATE,\
    transaction_type TEXT,\
    amount NUMERIC,\
    account_number INTEGER\
);\
\
INSERT INTO Customers (name, email, phone) VALUES\
    ('John Doe', 'johndoe@email.com', '555-1234'),\
    ('Jane Smith', 'janesmith@email.com', '555-5678'),\
    ('Alice Johnson', 'alicejohnson@email.com', '555-9876');\
\
INSERT INTO Accounts (balance) VALUES\
    (1000.00),\
    (2500.00),\
    (500.00);\
\
INSERT INTO Transactions (transaction_date, transaction_type, amount, account_number) VALUES\
    ('2023-01-15', 'Deposit', 500.00, 1),\
    ('2023-01-18', 'Withdrawal', 200.00, 2),\
    ('2023-01-20', 'Deposit', 300.00, 3);\
\
SELECT * FROM Transactions;\
\
SELECT Accounts.account_number, SUM(Transactions.amount) AS total_balance\
FROM Accounts\
LEFT JOIN Transactions ON Accounts.account_number = Transactions.account_number\
GROUP BY Accounts.account_number;\
\
INSERT INTO Transactions (transaction_date, transaction_type, amount, account_number) VALUES\
    ('2023-01-15', 'Deposit', 500.00, 1),\
    ('2023-01-18', 'Withdrawal', 200.00, 2),\
    ('2023-01-20', 'Deposit', 300.00, 3);\
\
SELECT Accounts.account_number, SUM(Transactions.amount) AS total_balance\
FROM Accounts\
LEFT JOIN Transactions ON Accounts.account_number = Transactions.account_number\
GROUP BY Accounts.account_number;\
\
ALTER TABLE Transactions\
ADD COLUMN customer_id INTEGER;\
\
PRAGMA foreign_keys = ON;\
\
SELECT Customers.name, Transactions.transaction_date\
FROM Customers\
JOIN Transactions ON Customers.customer_id = Transactions.customer_id\
WHERE Transactions.transaction_type = 'Deposit';\
\
SELECT AVG(amount) AS average_transaction_amount FROM Transactions;}