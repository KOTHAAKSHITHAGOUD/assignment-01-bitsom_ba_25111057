
-- Q1: List all customers along with the total number of orders they have placed
SELECT 
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders
FROM read_csv_auto('../datasets/customers.csv') c
LEFT JOIN read_json_auto('../datasets/orders.json') o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;


-- Q2: Find the top 3 customers by total order value
SELECT 
    c.customer_id,
    c.name,
    SUM(item.quantity) AS total_items
FROM read_csv_auto('../datasets/customers.csv') c
JOIN read_json_auto('../datasets/orders.json') o
ON c.customer_id = o.customer_id
JOIN UNNEST(o.items) AS item
GROUP BY c.customer_id, c.name
ORDER BY total_items DESC
LIMIT 3;


-- Q3: List all products purchased by customers from Bangalore
SELECT DISTINCT p.product_name
FROM read_csv_auto('../datasets/customers.csv') c
JOIN read_json_auto('../datasets/orders.json') o
ON c.customer_id = o.customer_id
JOIN UNNEST(o.items) AS item
JOIN read_parquet('../datasets/products.parquet') p
ON item.product_id = p.product_id
WHERE c.city = 'Bangalore';


-- Q4: Join all three files to show customer name, order date, product name, and quantity
SELECT 
    c.name,
    o.order_date,
    p.product_name,
    item.quantity
FROM read_csv_auto('../datasets/customers.csv') c
JOIN read_json_auto('../datasets/orders.json') o
ON c.customer_id = o.customer_id
JOIN UNNEST(o.items) AS item
JOIN read_parquet('../datasets/products.parquet') p
ON item.product_id = p.product_id;