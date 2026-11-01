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