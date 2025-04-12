-- Amazon Project - Using Advanced SQL
----------------***--------------------

-- Table creations
--================--

-- A)- PARENT TABLES
--------------------


-- 1)- category TABLE
CREATE TABLE category
(
category_id	INT PRIMARY KEY,
category_name VARCHAR(20)
);


-- 2)- customers TABLE
CREATE TABLE customers
(
customer_id INT PRIMARY KEY,
first_name VARCHAR(15),
last_name VARCHAR(15),
state VARCHAR(10),
address VARCHAR(5) DEFAULT ('xxxx')
);


-- 3)- sellers TABLE
CREATE TABLE sellers
(
seller_id INT PRIMARY KEY,
seller_name VARCHAR(20),
origin VARCHAR(10)
);



-- B)- CHILD TABLES
--------------------

-- 1)- products TABLE
CREATE TABLE products
(
product_id INT PRIMARY KEY,
product_name VARCHAR(150),
price FLOAT,
Cogs FLOAT,
category_id INT,--ForEign key(FK)
CONSTRAINT products_fk_category_id FOREIGN KEY(category_id) REFERENCES category(category_id)
);



-- 2)- orders TABLE
CREATE TABLE orders
(
order_id INT PRIMARY KEY,
order_date DATE,
customer_id INT,--FK
seller_id INT,--FK
order_status VARCHAR(15),
CONSTRAINT orders_fk_customer_id FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
CONSTRAINT orders_fk_seller_id FOREIGN KEY(seller_id) REFERENCES sellers(seller_id)
);



-- 3)- order_items TABLE
CREATE TABLE order_items
(
order_item_id INT PRIMARY KEY,
order_id INT,--FK
product_id INT,--FK
quantity INT,
price_per_unit FLOAT,
CONSTRAINT order_items_fk_order_id FOREIGN KEY(order_id) REFERENCES orders(order_id),
CONSTRAINT order_items_fk_product_id FOREIGN KEY(product_id) REFERENCES products(product_id)
);



--4)- payments TABLE
CREATE TABLE payments
(
payment_id INT PRIMARY KEY,
order_id INT,--FK
payment_date DATE,
payment_status VARCHAR(20),
CONSTRAINT payments_fk_order_id FOREIGN KEY(order_id) REFERENCES orders(order_id)
);



--5)- sippings TABLE
CREATE TABLE shippings
(
shipping_id INT PRIMARY KEY,
order_id INT,--FK
shipping_date DATE,
return_date DATE,
shipping_providers VARCHAR(20),
delivery_status VARCHAR(20),
CONSTRAINT shippings_fk_order_id FOREIGN KEY(order_id) REFERENCES orders(order_id)
);



-- 6)- inventory TABLE
CREATE TABLE inventory
(
inventory_id INT PRIMARY KEY,
product_id INT,--FK
stock INT,
warehouse_id INT,
last_stock_date DATE,
CONSTRAINT inventory_fk_product_id FOREIGN KEY(product_id) REFERENCES products(product_id)
);


-- Now we successfully created all the tables.
-- Next let's go to solve the questions.



