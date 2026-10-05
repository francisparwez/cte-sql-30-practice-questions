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

WITH high_value_orders AS (
	SELECT
		order_id,
		customer_id,
		order_date,
		amount
	FROM
		orders
	WHERE
		amount > 50000
) SELECT *
FROM
high_value_orders;

--2. Find Completed Orders
--The finance team only wants to analyze completed orders.
--Create a CTE containing only:
--	status = 'Completed'
--Then return:
--	order_id
--	customer_id
--	amount
--	status

WITH completed_orders AS (
	SELECT
		order_id,
		customer_id,
		amount,
		status
	FROM
		orders
	WHERE
		status = 'Completed'
) SELECT *
FROM
completed_orders;

