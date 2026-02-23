
-- Create Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

-- Create Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(50),
    amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Insert Sample Data
INSERT INTO Customers VALUES
(1, 'John Smith', 'Atlanta'),
(2, 'Maria Lopez', 'Marietta'),
(3, 'David Brown', 'Kennesaw');

INSERT INTO Orders VALUES
(101, 1, 'Laptop', 1200.00, '2024-01-15'),
(102, 2, 'Phone', 800.00, '2024-02-20'),
(103, 1, 'Monitor', 300.00, '2024-03-05'),
(104, 3, 'Tablet', 450.00, '2024-03-18');

-- JOIN Example
SELECT c.name, c.city, o.product, o.amount
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id;

-- GROUP BY Example
SELECT c.city, SUM(o.amount) AS total_sales
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.city;

-- Aggregate Example
SELECT AVG(amount) AS average_order_value
FROM Orders;
