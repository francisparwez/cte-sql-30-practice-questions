-- 11. Customer Spending Report
-- Create a CTE that calculates total spending for each customer.
-- Then join the CTE with customers .
-- Return:
--     customer_id
--     customer_name
--     city
--     total_spending
-- This is an important pattern:
--     orders
--     ↓
--     CTE: calculate spending
--     ↓
--     JOIN customers
--     ↓
--     customer report

USE CTE_Practice_DB;
GO

WITH
    customers_spending AS (
        SELECT c.customer_id, SUM(o.amount) AS total_spending
        FROM customers c
            JOIN orders o ON c.customer_id = o.customer_id
        WHERE
            o.status = 'Completed'
        GROUP BY
            c.customer_id
    )
SELECT cs.customer_id, c.customer_name, c.city, total_spending
FROM
    customers_spending cs
    JOIN customers c ON cs.customer_id = c.customer_id;

-- 12. High-Value Customer Report
-- Create a CTE containing customers whose total spending exceeds 100,000.
-- Then join it with the customers table.
-- Return:
--     customer_id
--     customer_name
--     city
--     total_spending

USE CTE_Practice_DB;
GO

WITH
    high_valued_customer AS (
        SELECT c.customer_id, SUM(o.amount) AS total_spending
        FROM customers c
            JOIN orders o ON c.customer_id = o.customer_id
        WHERE
            o.status = 'Completed'
        GROUP BY
            c.customer_id
        HAVING
            SUM(o.amount) > 100000
    )
SELECT h_v_c.customer_id, c.customer_name, c.city, h_v_c.total_spending
FROM
    high_valued_customer h_v_c
    JOIN customers c ON h_v_c.customer_id = c.customer_id;

-- 13. Customer Order Count Report
-- Create a CTE that calculates the number of orders for each customer.
-- Join it with customers .
-- Return:
--     customer_id
--     customer_name
--     order_count

USE CTE_Practice_DB;
GO

WITH
    customer_order_count AS (
        SELECT customer_id, COUNT(order_id) AS order_count
        FROM orders o
        GROUP BY
            customer_id
    )
SELECT c_o_c.customer_id, c.customer_name, c_o_c.order_count
FROM
    customer_order_count c_o_c
    JOIN customers c ON c_o_c.customer_id = c.customer_id;

-- 14. Customers With Completed Orders
-- Create a CTE containing customers who have completed orders.
-- Then join that result to customers .
-- Return:
--     customer_id
--     customer_name
--     city
-- Only customers with at least one completed order should appear.

USE CTE_Practice_DB;
GO

WITH
    completed_orders AS (
        SELECT DISTINCT
            customer_id
        FROM orders
        WHERE
            status = 'Completed'
    )
SELECT c.customer_id, c.customer_name, c.city
FROM
    customers c
    JOIN completed_orders co ON c.customer_id = co.customer_id;