--Exploratory Data Analysis(EDA)--

SELECT * FROM category;
SELECT * FROM customers;
SELECT * FROM sellers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;
SELECT * FROM payments;
SELECT * FROM shippings;
SELECT * FROM inventory;

SELECT * 
FROM shippings 
WHERE return_date IS NOT NULL;


SELECT count(*) 
FROM shippings 
WHERE return_date IS NULL;


SELECT 
DISTINCT payment_status 
FROM payments;


SELECT * 
FROM orders 
WHERE order_id = 16523;

SELECT *
FROM payments
WHERE order_id = 16523;