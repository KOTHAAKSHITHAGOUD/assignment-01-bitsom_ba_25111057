

-- Dimension: Date
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    month INT,
    year INT
);

-- Dimension: Store
CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    city VARCHAR(50)
);

-- Dimension: Product
CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

-- Fact Table
CREATE TABLE fact_sales (
    sale_id INT PRIMARY KEY,
    date_id INT,
    store_id INT,
    product_id INT,
    quantity INT,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- ==========================================
-- CLEANED SAMPLE DATA (BASED ON DATASET STYLE)
-- ==========================================

-- Dates (standardized)
INSERT INTO dim_date VALUES
(1, '2024-01-01', 1, 2024),
(2, '2024-01-15', 1, 2024),
(3, '2024-02-01', 2, 2024),
(4, '2024-02-10', 2, 2024),
(5, '2024-03-05', 3, 2024);

-- Stores (cleaned names)
INSERT INTO dim_store VALUES
(1, 'Mumbai Store', 'Mumbai'),
(2, 'Delhi Store', 'Delhi'),
(3, 'Bangalore Store', 'Bangalore');

-- Products (standardized categories)
INSERT INTO dim_product VALUES
(1, 'Laptop', 'Electronics'),
(2, 'T-Shirt', 'Clothing'),
(3, 'Rice Bag', 'Groceries');

-- Fact Sales (10 rows)
INSERT INTO fact_sales VALUES
(1, 1, 1, 1, 2, 100000),
(2, 2, 2, 2, 5, 5000),
(3, 3, 1, 3, 10, 2000),
(4, 4, 3, 1, 1, 50000),
(5, 5, 2, 2, 3, 3000),
(6, 1, 3, 3, 8, 1600),
(7, 2, 1, 1, 1, 50000),
(8, 3, 2, 2, 4, 4000),
(9, 4, 3, 3, 6, 1200),
(10, 5, 1, 1, 2, 100000);