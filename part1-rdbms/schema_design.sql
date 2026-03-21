========

-- 1. Customers Table
CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    signup_date DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- 2. Sales Representatives Table
CREATE TABLE sales_reps (
    rep_id VARCHAR(10) PRIMARY KEY,
    rep_name VARCHAR(100) NOT NULL
);

-- 3. Products Table
CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

-- 4. Orders Table
CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    rep_id VARCHAR(10) NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (rep_id) REFERENCES sales_reps(rep_id)
);

-- 5. Order Items Table
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id VARCHAR(10) NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- ==========================================
-- INSERT DATA (Minimum 5 Rows Each)
-- ==========================================

-- Customers
INSERT INTO customers VALUES
('CUST001', 'Rohan Iyer', 'Kolkata', '2023-04-16', 'user1@example.com'),
('CUST002', 'Aditya Shah', 'Mumbai', '2022-06-11', 'user2@example.com'),
('CUST003', 'Arjun Singh', 'Pune', '2023-03-15', 'user3@example.com'),
('CUST004', 'Neha Joshi', 'Mumbai', '2022-11-06', 'user4@example.com'),
('CUST005', 'Divya Joshi', 'Mumbai', '2023-11-02', 'user5@example.com');

-- Sales Representatives
INSERT INTO sales_reps VALUES
('SR01', 'Rajesh'),
('SR02', 'Suman'),
('SR03', 'Vikram'),
('SR04', 'Pooja'),
('SR05', 'Amit');

-- Products
INSERT INTO products VALUES
('P101', 'Wireless Mouse', 1200.00),
('P102', 'Mechanical Keyboard', 4500.00),
('P103', '27-inch Monitor', 18000.00),
('P104', 'USB-C Hub', 2500.00),
('P105', 'Noise Cancelling Headphones', 12000.00);

-- Orders
INSERT INTO orders VALUES
('ORD1001', 'CUST001', 'SR01', '2024-01-05'),
('ORD1002', 'CUST002', 'SR02', '2024-01-07'),
('ORD1003', 'CUST003', 'SR01', '2024-01-10'),
('ORD1004', 'CUST004', 'SR03', '2024-01-12'),
('ORD1005', 'CUST005', 'SR05', '2024-01-15');

-- Order Items
INSERT INTO order_items VALUES
(1, 'ORD1001', 'P101', 2),
(2, 'ORD1002', 'P103', 1),
(3, 'ORD1003', 'P102', 1),
(4, 'ORD1004', 'P105', 1),
(5, 'ORD1005', 'P104', 3);