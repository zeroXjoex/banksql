-- Create tables
CREATE TABLE IF NOT EXISTS Customer (
    CustomerID INTEGER PRIMARY KEY,
    FirstName TEXT,
    LastName TEXT,
    Email TEXT
);
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INTEGER PRIMARY KEY,
    CustomerID INTEGER,
    OrderDate DATE,
    TotalAmount REAL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
-- Insert sample data
INSERT INTO Customer (FirstName, LastName, Email) VALUES
('Alice', 'Smith', 'alice@example.com'),
('Bob', 'Johnson', 'bob@example.com'),
('Charlie', 'Brown', 'charlie@example.com');
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2023-01-15', 500.00),
(2, '2023-02-20', 750.50),
(3, '2023-03-10', 1200.00);
-- Select customer information and their total order amounts
SELECT
    c.FirstName,
    c.LastName,
    c.Email,
    o.TotalAmount
FROM
    Customer c
JOIN
    Orders o ON c.CustomerID = o.CustomerID
ORDER BY
    c.FirstName ASC;
-- Select customers who have made orders over $1000
SELECT
    FirstName,
    LastName,
    Email
FROM
    Customer
WHERE
    CustomerID IN (
        SELECT CustomerID
        FROM Orders
        WHERE TotalAmount > 1000.00
    );
-- Calculate the average order amount
SELECT
    AVG(TotalAmount) AS AverageOrderAmount
FROM
    Orders;