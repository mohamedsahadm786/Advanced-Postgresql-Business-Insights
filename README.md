# Advanced-PostgreSQL-Business-Insights

## - Advanced PostgreSQL Project - Amazon Purchasing Dataset

### 📊 Project Overview

This project focuses on solving complex business problems for Amazon purchasing using PostgreSQL. The dataset used contains information about products, customers, sellers, orders, and inventory, simulating an Amazon database. The goal of this project was to extract meaningful business insights and perform advanced database operations.

### ✅ Key Business Problems Solved

1. Top Selling Products

Objective: Identify the top 10 products by total sales value, including product name, category, quantity sold, and total sales value.

2. Revenue By Category

Objective: Calculate the total revenue generated by each product category and their percentage contribution to total revenue.

3. Average Order Value (AOV)

Objective: Calculate the average order value for each customer, considering only customers with more than 40 orders.

4. Monthly Sales Trend

Objective: Track monthly total sales over the year 2016, comparing current-month and last-month sales.

5. Customers With No Purchases

Objective: Identify customers who have registered but never placed an order.

6. Least Selling Categories by State

Objective: Find the least selling product category for each state and include the total sales for that category.

7. Customer Lifetime Value (CLTV)

Objective: Calculate the total value of orders placed by each customer over their lifetime and rank them based on CLTV.

8. Inventory Stock Alerts

Objective: Query products with stock levels below a threshold (e.g., less than 10 units) along with their last restock date and warehouse information.

9. Shipping Delays

Objective: Identify orders where the shipping date is later than 4 days after the order date, along with customer, order, and delivery provider details.

10. Payment Success Rate

Objective: Calculate the percentage of successful payments across all orders, including a breakdown by payment status.

11. Top Performing Sellers

Objective: Identify the top 5 sellers based on total sales value, including both successful and failed orders, and their percentage of successful orders.

12. Product Profit Margin

Objective: Calculate the profit margin for each product (difference between price and cost of goods sold) and rank products from highest to lowest profit margin.

13. Most Returned Product

Objective: Identify the top 10 products by the number of returns and calculate the return rate as a percentage of total units sold.

14. Identify Inactive Sellers

Objective: Identify sellers who haven't made any sales in the last 4 months of 2017 and include their last sale date.

15. Classify Customers into Returning or New

Objective: Classify customers as either returning or new based on their purchase history. If a new customer has made more than 5 returns, classify them as returning.

16. Top 5 Customers by Orders in Each State

Objective: Identify the top 5 customers with the highest number of orders for each state, including total orders and total sales.

17. Revenue By Shipping Provider

Objective: Calculate the total revenue handled by each shipping provider, including the number of orders handled and the average shipping time.

18. Products with Highest Decrease in Revenue

Objective: Identify the top 10 products with the highest decrease in revenue from 2016 to 2017, calculating the revenue decrease ratio.


## 📝 Store Procedure (Question 19)

### Objective:

Create a store procedure to automatically update the inventory stock whenever a product is sold. This procedure ensures that after adding any sales record, the inventory table is updated based on the product and quantity purchased.

### Functionality:

Trigger: The procedure is triggered after a sales record is inserted.

Update: It reduces the stock quantity from the inventory table based on the product sold.



```markdown
### **SQL Code:**
```
```sql

CREATE OR REPLACE PROCEDURE add_sales
(
 p_order_id INT,
 p_customer_id INT,
 p_seller_id INT,
 p_order_item_id INT,
 p_product_id INT,
 p_quantity INT
)
LANGUAGE plpgsql
AS
$$

DECLARE
-- All variables
v_count INT;
v_price FLOAT;
v_product VARCHAR(50);

BEGIN
-- All the code and logic
    -- Fetching product_name and price based on product_id enterd
    SELECT 
	    price, product_name
	    INTO 
		v_price,v_product
	FROM products
	WHERE product_id = p_product_id;

	-- Checking stock and product availability in inventory
	SELECT
	    COUNT(*) INTO v_count
	FROM inventory
	WHERE product_id = p_product_id 
	      AND 
		  stock >= p_quantity;
		  
	IF v_count > 0 
	
	THEN
	-- Add into orders and order_items table
	-- update inventory
	
		INSERT INTO orders(order_id, order_date, customer_id, seller_id)
		VALUES
		(p_order_id,CURRENT_DATE,p_customer_id,p_seller_id);

		-- adding into order list
		INSERT INTO order_items(order_item_id,order_id,product_id,quantity,price_per_unit,total_sale)
		VALUES
		(p_order_item_id,p_order_id,p_product_id,p_quantity,v_price,v_price * p_quantity);

		-- updating inventory
		UPDATE inventory
		SET stock = stock - p_quantity
		WHERE product_id = p_product_id;

		RAISE NOTICE 'Thank you Product: % sale has been added also inventory stock updates',v_product;
		
	ELSE
		RAISE NOTICE 'Thank you for your info the product: % is not available',v_product;

	END IF;


END;
$$
```

## 📊 ER Diagram
Here is the Entity Relationship Diagram (ERD) for the Amazon purchasing database:  

![ER Diagram](https://github.com/mohamedsahadm786/advanced-postgresql-business-insights/blob/main/erd.png)

## 💡 Conclusion

### This project involved advanced-level PostgreSQL queries addressing complex business problems within an Amazon purchasing context. The highlight of the project was the creation of a Store Procedure to automate inventory stock updates upon sales, showcasing advanced database management skills. This project can significantly contribute to business intelligence, data-driven decision-making, and operational efficiency.
