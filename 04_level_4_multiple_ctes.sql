-- LEVEL 4 — Multiple CTEs

-- 16. High-Value Customer Identification
-- Create two CTEs:
-- CTE 1
-- Calculate total spending for every customer.
-- CTE 2
-- Filter those customers to only customers spending more than:
--     100000
-- Then join the result with customers .
-- Return:
--     customer_id
--     customer_name
--     city
--     total_spending
-- Think:
--     orders
--     ↓
--     CTE 1: customer spending
--     ↓
--     CTE 2: high-value customers
--     ↓
--     customers
--     ↓
--     final report

USE CTE_Practice_DB;
GO

WITH
    customers_spending AS (
        SELECT customer_id, SUM(amount) AS total_spending
        FROM orders
        GROUP BY
            customer_id
    ),
    high_value_customers AS (
        SELECT *
        FROM customers_spending
        WHERE
            total_spending > 100000
    )
SELECT hvc.customer_id, c.customer_name, c.city, hvc.total_spending
FROM
    high_value_customers hvc
    JOIN customers c ON hvc.customer_id = c.customer_id;