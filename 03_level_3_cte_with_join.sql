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