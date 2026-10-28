USE CTE_Practice_DB;
GO

--1. Find High-Value Orders
--The sales team wants a list of orders worth more than 50,000.
--Create a CTE containing only orders where:
--	amount > 50000
--Then retrieve the results from the CTE.
--Return:
--	order_id
--	customer_id
--	order_date
--	amount
--Goal: Learn the basic:
--	WITH cte_name AS (...)
--	SELECT ...
--	FROM cte_name;

WITH
    high_value_orders AS (
        SELECT
            order_id,
            customer_id,
            order_date,
            amount
        FROM orders
        WHERE
            amount > 50000
    )
SELECT *
FROM high_value_orders;

--2. Find Completed Orders
--The finance team only wants to analyze completed orders.
--Create a CTE containing only:
--	status = 'Completed'
--Then return:
--	order_id
--	customer_id
--	amount
--	status

WITH
    completed_orders AS (
        SELECT
            order_id,
            customer_id,
            amount,
            status
        FROM orders
        WHERE
            status = 'Completed'
    )
SELECT *
FROM completed_orders;

-- 3. Find Customers From Karachi
-- The marketing team wants to analyze Karachi customers separately.
-- Create a CTE containing only customers whose city is Karachi.
-- Return:
-- 	customer_id
-- 	customer_name
-- 	city
-- 	signup_date

WITH
    customers_in_karachi AS (
        SELECT
            customer_id,
            customer_name,
            city,
            signup_date
        FROM customers
        WHERE
            city = 'Karachi'
    )
SELECT *
FROM customers_in_karachi;

--4. Find Expensive Products
--The product team considers products above 10,000 to be premium products.
--Create a CTE containing premium products.
--Return:
--	product_id
--	product_name
--	category
--	price

WITH
    premium_products AS (
        SELECT
            product_id,
            product_name,
            category,
            price
        FROM products
        WHERE
            price >= 10000
    )
SELECT *
FROM premium_products;

-- 5. Find Recent Customers
-- The company wants to identify customers who signed up after:
-- 	2025-01-01
-- Create a CTE for these customers.
-- Return:
-- 	customer_id
-- 	customer_name
-- 	signup_date

WITH
    recent_customers AS (
        SELECT
            customer_id,
            customer_name,
            signup_date
        FROM customers
        WHERE
            signup_date > '2025-01-01'
    )
SELECT *
FROM recent_customers;