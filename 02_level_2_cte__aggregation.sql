-- 6. Calculate Total Revenue
-- Create a CTE that calculates the company's total revenue from completed orders.
-- Return:
--     total_revenue
-- Think:
--     orders
--     ↓
--     filter completed
--     ↓
--     SUM(amount)
--     ↓
--     CTE

USE CTE_Practice_DB;
GO

WITH
    completed_orders AS (
        SELECT
			amount,
			[status]
        FROM orders
        WHERE
            status = 'Completed'
    )
SELECT SUM(amount) AS total_revenue
FROM completed_orders;

-- 7. Calculate Revenue by Customer
-- Create a CTE that calculates how much each customer has spent.
-- Return:
--     customer_id
--     total_spending
-- Only include completed orders.

WITH
    completed_customer_order AS (
        SELECT c.customer_id, o.amount
        FROM customers c
            JOIN orders o ON c.customer_id = o.customer_id
        WHERE
            o.status = 'Completed'
    )
SELECT customer_id, SUM(amount) AS total_spending
FROM completed_customer_order
GROUP BY
    customer_id;

--8. Find Customers Spending More Than 100,000
--First create a CTE containing each customer's total spending.
--Then use the CTE to find customers whose spending is greater than:
--	100000
--Return:
--	customer_id
--	total_spending
--Important: Don't calculate the SUM() again in the outer query.

WITH
    customers_total_spending AS (
        SELECT c.customer_id, SUM(o.amount) AS total_spending
        FROM customers c
            JOIN orders o ON c.customer_id = o.customer_id
        WHERE
            o.status = 'Completed'
        GROUP BY
            c.customer_id
    )
SELECT *
FROM customers_total_spending
WHERE
    total_spending > 100000

-- 9. Calculate Average Order Amount
-- Create a CTE containing completed orders.
-- Then calculate the average order amount from that CTE.
-- Return:
--     average_order_amount
-- This teaches you how one CTE can become the input to another query.

WITH
    completed_orders AS (
        SELECT amount
        FROM orders
        WHERE
            status = 'Completed'
    )
SELECT CAST(AVG(amount) AS DECIMAL(10, 2)) AS average_order_amount
FROM completed_orders;

-- 10. Find Customers With More Than 3 Orders
-- Create a CTE that counts orders for each customer.
-- Then return customers who have made more than 3 orders.
-- Return:
--	customer_id
--	order_count

WITH
    customer_order_counts AS (
        SELECT customer_id, COUNT(order_id) AS total_orders
        FROM orders
        GROUP BY
            customer_id
    )
SELECT customer_id, total_orders
FROM customer_order_counts
WHERE
    total_orders > 3;