# 📦 Advanced PostgreSQL Business Insights  
**Amazon Purchasing Dataset | SQL & PL/pgSQL Analytics Project**

---

## 📊 Project Overview

This project focuses on **advanced business analytics using PostgreSQL** on a simulated **Amazon purchasing database**.  
The dataset represents real-world e-commerce entities such as **customers, products, sellers, orders, payments, shipping, and inventory**.

The primary objective is to extract **actionable business insights** and demonstrate **advanced SQL and PL/pgSQL capabilities** used in high-volume transactional systems.

This project is designed to reflect **industry-level database analytics and operational SQL workflows**, not academic querying.

---

## 🎯 Business Context

Large e-commerce platforms must continuously monitor:

- Revenue and profitability across products and categories  
- Customer lifetime value and purchase behavior  
- Seller performance and inactivity  
- Inventory risks and stock shortages  
- Shipping delays and payment failures  

This project simulates how **data teams support commercial, operations, and supply-chain decisions** using SQL alone.

---

## 🛠️ Tools & Technologies

- **PostgreSQL**
- **Advanced SQL**
- **PL/pgSQL**
- **Stored Procedures**
- **Query Optimization**
- **Relational Data Modeling**

---

## 🗂️ Dataset Description

The database simulates an Amazon-like schema containing:

- Customers  
- Sellers  
- Products  
- Orders & Order Items  
- Inventory  
- Payments  
- Shipping Providers  
- Returns  

The schema is designed to support **transactional analysis, operational monitoring, and business intelligence**.

---

## 🔍 Key Business Problems Solved (SQL)

Below are the **real business problems solved using SQL**, not toy examples.

### 1️⃣ Top Selling Products
Identified the **top 10 products by total sales value**, including category, quantity sold, and revenue contribution.

---

### 2️⃣ Revenue by Category
Calculated **category-wise revenue** and each category’s **percentage contribution** to total sales.

---

### 3️⃣ Average Order Value (AOV)
Computed **customer-level AOV**, filtering for customers with **high purchase frequency (>40 orders)**.

---

### 4️⃣ Monthly Sales Trend
Analyzed **month-over-month sales trends** for 2016, comparing current vs previous month performance.

---

### 5️⃣ Customers with No Purchases
Identified **registered customers with zero orders**, highlighting acquisition-to-conversion gaps.

---

### 6️⃣ Least Selling Categories by State
Detected **underperforming product categories per state**, supporting regional optimization.

---

### 7️⃣ Customer Lifetime Value (CLTV)
Calculated **customer lifetime value** and ranked customers based on total spending.

---

### 8️⃣ Inventory Stock Alerts
Flagged products with **low stock levels** (below threshold) along with warehouse and restock details.

---

### 9️⃣ Shipping Delays
Identified orders with **shipping delays greater than 4 days**, including logistics provider details.

---

### 🔟 Payment Success Rate
Computed **overall and status-wise payment success rates**, highlighting transaction reliability.

---

### 1️⃣1️⃣ Top Performing Sellers
Ranked sellers based on:
- Total sales value  
- Order volume  
- Percentage of successful transactions  

---

### 1️⃣2️⃣ Product Profit Margin
Calculated **profit margins** (price − cost) and ranked products by profitability.

---

### 1️⃣3️⃣ Most Returned Products
Identified products with the **highest return rates**, enabling quality and policy review.

---

### 1️⃣4️⃣ Inactive Sellers
Detected sellers with **no sales activity in the last 4 months of 2017**.

 hookupresents inactive sellers with last transaction date.

---

### 1️⃣5️⃣ Customer Classification
Classified customers into:
- **New**
- **Returning**

based on purchase and return behavior.

---

### 1️⃣6️⃣ Top Customers by State
Identified **top 5 customers per state** by order count and revenue.

---

### 1️⃣7️⃣ Revenue by Shipping Provider
Analyzed revenue handled by each shipping provider, including:
- Order count  
- Average shipping time  

---

### 1️⃣8️⃣ Products with Revenue Decline
Identified products with the **highest revenue decrease between 2016 and 2017**.

---

## ⚙️ Automation with PL/pgSQL (Stored Procedure)

### 🔹 Objective
Automate **inventory stock updates** whenever a new sale occurs, eliminating manual stock adjustments.

---

### 🔹 Procedure Logic

- Triggered after a sale is inserted  
- Validates product availability  
- Inserts order and order-item records  
- Updates inventory stock in real time  
- Handles insufficient stock scenarios gracefully  

---

### 🔹 Stored Procedure (PL/pgSQL)

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
    v_count INT;
    v_price FLOAT;
    v_product VARCHAR(50);
BEGIN
    SELECT price, product_name
    INTO v_price, v_product
    FROM products
    WHERE product_id = p_product_id;

    SELECT COUNT(*) INTO v_count
    FROM inventory
    WHERE product_id = p_product_id
      AND stock >= p_quantity;

    IF v_count > 0 THEN

        INSERT INTO orders(order_id, order_date, customer_id, seller_id)
        VALUES (p_order_id, CURRENT_DATE, p_customer_id, p_seller_id);

        INSERT INTO order_items(order_item_id, order_id, product_id, quantity, price_per_unit, total_sale)
        VALUES (p_order_item_id, p_order_id, p_product_id, p_quantity, v_price, v_price * p_quantity);

        UPDATE inventory
        SET stock = stock - p_quantity
        WHERE product_id = p_product_id;

        RAISE NOTICE 'Product % sold and inventory updated successfully', v_product;

    ELSE
        RAISE NOTICE 'Product % is not available in sufficient quantity', v_product;
    END IF;
END;
$$;
```

---

## 🧠 SQL & Database Concepts Demonstrated

- Complex joins and aggregations  
- Subqueries and filtering logic  
- Window functions  
- Ranking and segmentation  
- Time-series analysis  
- PL/pgSQL procedural logic  
- Transaction-safe inventory updates  

---

## 📊 ER Diagram

The database follows a normalized relational structure suitable for **high-volume e-commerce analytics**.

Here is the Entity Relationship Diagram (ERD) for the Amazon purchasing database:  

![ER Diagram](https://github.com/mohamedsahadm786/advanced-postgresql-business-insights/blob/main/erd.png)

---

## 💡 Business Impact

This project demonstrates how **SQL alone** can be used to:

- Drive revenue and profitability analysis  
- Monitor seller and customer performance  
- Detect operational risks (inventory, shipping, payments)  
- Automate critical backend workflows  

---

## 🏁 Conclusion

This project showcases **advanced PostgreSQL skills** applied to real-world business problems, combining **analytical querying** with **operational automation** using PL/pgSQL.

It reflects the type of database-driven analysis expected in:
- Database Analyst  
- Analytics Engineer  
- Backend Data Engineer roles  

---

## 👤 Author

**Mohamed Sahad M**  
Master’s in Statistics  
PostgreSQL | SQL | Data Analytics | Business Intelligence  

