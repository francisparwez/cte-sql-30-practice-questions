# 🟢 30 Beginner CTE Practice Questions --- SQL Server

A beginner-friendly **T-SQL Common Table Expression (CTE) practice project** built around a small e-commerce dataset.

The goal is to learn how to use CTEs to break analytical problems into clear, reusable steps --- starting with simple filtering and progressing to aggregation, joins, multiple CTEs, comparisons, time-based analysis, and business-focused analytical pipelines.

---

## 📌 Project Overview

This project is designed for practicing **CTEs in Microsoft SQL Server**.

The practice progression is:

```text
Basic CTEs
   ↓
CTE + Aggregation
   ↓
CTE + JOIN
   ↓
Multiple CTEs
   ↓
Business Analytics
   ↓
Time-Based Analytics
   ↓
Beginner Boss Challenges
```

The 30 questions are intentionally kept at beginner level while gradually increasing the amount of analytical thinking required.

---

## 🗄️ SQL Environment

**Database:** `CTE_Practice_DB`\
**SQL Dialect:** T-SQL / Microsoft SQL Server

The database is created in the SQL schema file:

```sql
CREATE DATABASE CTE_Practice_DB;
GO

USE CTE_Practice_DB;
GO
```

---

# 🧱 Database Schema

The project contains **4 related tables**:

```text
customers
    │
    │ 1-to-many
    ▼
  orders
    │
    │ 1-to-many
    ▼
order_items
    ▲
    │ many-to-1
    │
products
```

### 1. `customers`

Stores customer information.

Column Data Type Description

---

`customer_id` INT Primary key
`customer_name` VARCHAR(100) Customer name
`city` VARCHAR(50) Customer city
`signup_date` DATE Customer signup date

**Records:** 25 customers

---

### 2. `orders`

Stores customer orders.

Column Data Type Description

---

`order_id` INT Primary key
`customer_id` INT Foreign key to `customers`
`order_date` DATE Date of order
`amount` DECIMAL(12,2) Order amount
`status` VARCHAR(20) Order status

**Records:** 40 orders

The dataset contains these order statuses:

- `Completed`
- `Pending`
- `Cancelled`

---

### 3. `products`

Stores products available for purchase.

Column Data Type Description

---

`product_id` INT Primary key
`product_name` VARCHAR(100) Product name
`category` VARCHAR(50) Product category
`price` DECIMAL(10,2) Product price

**Records:** 25 products

Example categories include:

- Laptops
- Smartphones
- Tablets
- Accessories
- Monitors
- Wearables
- Storage

---

### 4. `order_items`

Stores products included in each order.

Column Data Type Description

---

`order_id` INT Foreign key to `orders`
`product_id` INT Foreign key to `products`
`quantity` INT Quantity purchased

The table uses a composite primary key:

```sql
PRIMARY KEY (order_id, product_id)
```

---

# 📊 Dataset Summary

Table Purpose Records

---

`customers` Customer information 25
`products` Product catalog 25
`orders` Customer orders 40
`order_items` Products within orders 55

The data covers customer signups from **January 2024 to March 2025** and orders from **January 2025 to May 2025**.

---

# 🎯 Practice Questions

## 🟢 Level 1 --- Understanding a Basic CTE

### 1. Find High-Value Orders

The sales team wants a list of orders worth more than `50,000`.

Create a CTE containing only orders where:

```text
amount > 50000
```

Return:

- `order_id`
- `customer_id`
- `order_date`
- `amount`

**Goal:** Learn the basic `WITH cte_name AS (...)` structure.

---

### 2. Find Completed Orders

The finance team only wants to analyze completed orders.

Create a CTE containing only:

```text
status = 'Completed'
```

Return:

- `order_id`
- `customer_id`
- `amount`
- `status`

---

### 3. Find Customers From Karachi

The marketing team wants to analyze Karachi customers separately.

Create a CTE containing only customers whose city is:

```text
Karachi
```

Return:

- `customer_id`
- `customer_name`
- `city`
- `signup_date`

---

### 4. Find Expensive Products

The product team considers products above `10,000` to be premium products.

Create a CTE containing premium products.

Return:

- `product_id`
- `product_name`
- `category`
- `price`

---

### 5. Find Recent Customers

The company wants to identify customers who signed up after:

```text
2025-01-01
```

Create a CTE for these customers.

Return:

- `customer_id`
- `customer_name`
- `signup_date`

---

# 🟢 Level 2 --- CTE + Aggregation

Now use CTEs to perform an aggregation first and then query the resulting dataset.

---

### 6. Calculate Total Revenue

Create a CTE that calculates the company's total revenue from completed orders.

Return:

- `total_revenue`

Think:

```text
orders
   ↓
filter completed
   ↓
SUM(amount)
   ↓
CTE
```

---

### 7. Calculate Revenue by Customer

Create a CTE that calculates how much each customer has spent.

Only include completed orders.

Return:

- `customer_id`
- `total_spending`

---

### 8. Find Customers Spending More Than 100,000

First create a CTE containing each customer's total spending.

Then use the CTE to find customers whose spending is greater than:

```text
100000
```

Return:

- `customer_id`
- `total_spending`

**Important:** Do not calculate the `SUM()` again in the outer query.

---

### 9. Calculate Average Order Amount

Create a CTE containing completed orders.

Then calculate the average order amount from that CTE.

Return:

- `average_order_amount`

---

### 10. Find Customers With More Than 3 Orders

Create a CTE that counts orders for each customer.

Then return customers who have made more than:

```text
3 orders
```

Return:

- `customer_id`
- `order_count`

---

# 🟢 Level 3 --- CTE + JOIN

Now bring multiple tables into CTE-based analysis.

---

### 11. Customer Spending Report

Create a CTE that calculates total spending for each customer.

Then join the CTE with `customers`.

Return:

- `customer_id`
- `customer_name`
- `city`
- `total_spending`

Pattern:

```text
orders
   ↓
CTE: calculate spending
   ↓
JOIN customers
   ↓
customer report
```

---

### 12. High-Value Customer Report

Create a CTE containing customers whose total spending exceeds:

```text
100000
```

Then join it with the `customers` table.

Return:

- `customer_id`
- `customer_name`
- `city`
- `total_spending`

---

### 13. Customer Order Count Report

Create a CTE that calculates the number of orders for each customer.

Join it with `customers`.

Return:

- `customer_id`
- `customer_name`
- `order_count`

---

### 14. Customers With Completed Orders

Create a CTE containing customers who have completed orders.

Then join that result to `customers`.

Only customers with at least one completed order should appear.

Return:

- `customer_id`
- `customer_name`
- `city`

---

### 15. City Revenue Report

Create a CTE that calculates total completed-order revenue for each city.

You will need to join:

```text
customers
   +
orders
```

inside the CTE.

Return:

- `city`
- `total_revenue`

---

# 🟢 Level 4 --- Multiple CTEs

Now start using more than one CTE.

---

### 16. High-Value Customer Identification

Create two CTEs:

**CTE 1**

Calculate total spending for every customer.

**CTE 2**

Filter those customers to only customers spending more than:

```text
100000
```

Then join the result with `customers`.

Return:

- `customer_id`
- `customer_name`
- `city`
- `total_spending`

Think:

```text
orders
   ↓
CTE 1: customer spending
   ↓
CTE 2: high-value customers
   ↓
customers
   ↓
final report
```

---

### 17. Customer Spending vs Company Average

Create:

**CTE 1**

Calculate total spending per customer.

**CTE 2**

Calculate the average customer spending from CTE 1.

Then return customers whose spending is greater than the company-wide average.

Return:

- `customer_id`
- `total_spending`

Pattern:

```text
individual metric
       ↓
aggregate metric
       ↓
comparison
```

---

### 18. Large Orders vs Average Order

Create:

**CTE 1**

Get completed orders.

**CTE 2**

Calculate the average order amount.

Then return orders whose amount is greater than the average.

Return:

- `order_id`
- `customer_id`
- `amount`

---

### 19. High-Spending Customers With Their Order Count

Create:

**CTE 1**

Calculate customer spending.

**CTE 2**

Calculate customer order count.

Then join the two CTEs.

Finally return customers who spent more than:

```text
100000
```

Return:

- `customer_id`
- `total_spending`
- `order_count`

---

### 20. Customer Performance Summary

Create multiple CTEs:

- CTE 1: Customer total spending
- CTE 2: Customer order count

Then join them with `customers`.

Return:

- `customer_id`
- `customer_name`
- `city`
- `total_spending`
- `order_count`

This should resemble a small analytical dataset that could be given to a
business analyst.

---

# 🟢 Level 5 --- CTE + Business Analytics

The questions are still beginner level, but now focus more on realistic
business problems.

---

### 21. Find the Highest-Spending City

First create a CTE containing:

- `city`
- `total_revenue`

Then use the CTE to find the city with the highest revenue.

Return:

- `city`
- `total_revenue`

**Restriction:** Do not calculate city revenue twice.

---

### 22. Find the Highest-Spending Customer

Create a CTE containing each customer's total spending.

Then find the customer with the highest spending.

Return:

- `customer_id`
- `total_spending`

You may use `TOP 1`.

---

### 23. Find Products Above Average Price

Create a CTE containing the average product price.

Then return products whose price is above the average.

Return:

- `product_id`
- `product_name`
- `price`

Think:

```text
products
   ↓
CTE
   ↓
average price
   ↓
compare products against average
```

---

### 24. Find Customers Above Average Spending

Create a CTE containing:

- `customer_id`
- `total_spending`

Create another CTE containing the average customer spending.

Return customers whose spending is above the average.

Return:

- `customer_id`
- `total_spending`

---

### 25. Find Cities Above Average Revenue

Create a CTE containing revenue by city.

Then calculate the average city revenue.

Return cities whose revenue is above the average city revenue.

Return:

- `city`
- `total_revenue`

---

# 🟢 Level 6 --- CTE + Time-Based Analytics

Now apply CTEs to date-based analysis.

---

### 26. Monthly Revenue Report

Create a CTE that calculates completed revenue for each month.

Return:

- `month`
- `monthly_revenue`

You can use:

```sql
DATEFROMPARTS(
    YEAR(order_date),
    MONTH(order_date),
    1
)
```

as the month.

---

### 27. Find the Best Revenue Month

First create a CTE containing monthly revenue.

Then find the month with the highest revenue.

Return:

- `month`
- `monthly_revenue`

You may use `TOP 1`.

---

### 28. Find Months Above Average Revenue

Create a CTE containing monthly revenue.

Then calculate the average monthly revenue.

Return months where revenue is greater than the average monthly revenue.

Return:

- `month`
- `monthly_revenue`

Pattern:

```text
CTE
   ↓
aggregate
   ↓
comparison
```

---

# 🏆 Level 7 --- Beginner Boss Challenges

These are still beginner-level because no advanced SQL techniques are
introduced. The challenge is learning how to break a business problem
into multiple analytical stages.

---

### 29. Customer Value Analysis

Management wants a basic customer performance report.

Build the analysis using CTEs.

Calculate:

- total customer spending
- total number of orders
- average order amount

Then join the results with the customer table.

Return:

- `customer_id`
- `customer_name`
- `city`
- `total_spending`
- `order_count`
- `average_order_amount`

Suggested thinking:

```text
orders
   / \
  /   \
 ↓     ↓
CTE    CTE
spending  order count
  \     /
   \   /
    CTE / analysis
         ↓
     customers
         ↓
    final report
```

---

### 30. 🏆 Beginner Boss Challenge --- Customer Analytics Pipeline

This is the final Beginner CTE challenge.

The business wants to identify its most valuable customers.

Build the analysis using multiple CTEs.

#### CTE 1 --- Completed Orders

Create a dataset containing only completed orders.

#### CTE 2 --- Customer Spending

Calculate:

- `customer_id`
- `total_spending`

from CTE 1.

#### CTE 3 --- Customer Order Count

Calculate:

- `customer_id`
- `order_count`

from CTE 1.

#### CTE 4 --- Customer Average Order

Calculate:

- `customer_id`
- `average_order_amount`

from CTE 1.

#### Final Query

Join the CTE results with `customers`.

Return:

- `customer_id`
- `customer_name`
- `city`
- `total_spending`
- `order_count`
- `average_order_amount`

Then return only customers who satisfy:

```text
total_spending > 100000
```

Analytical pipeline:

```text
                 orders
                    │
                    ▼
        ┌─────────────────────┐
        │ CTE 1               │
        │ Completed Orders    │
        └──────────┬──────────┘
                   │
          ┌────────┼────────┐
          ▼        ▼        ▼
       CTE 2     CTE 3    CTE 4
      Spending   Orders   Average
          │        │        │
          └────────┼────────┘
                   ▼
               customers
                   │
                   ▼
             Final Report
                   │
                   ▼
         High-Value Customers
```

---

# 🧠 What These 30 Questions Teach

The goal is **not** to memorize 30 different CTE tricks.

Instead, these exercises teach a small number of reusable analytical patterns.

## Pattern 1 --- Simple CTE

```sql
WITH filtered_data AS (
    SELECT ...
    FROM ...
    WHERE ...
)
SELECT *
FROM filtered_data;
```

---

## Pattern 2 --- CTE + Aggregation

```sql
WITH customer_sales AS (
    SELECT
        customer_id,
        SUM(amount) AS total_spending
    FROM orders
    GROUP BY customer_id
)
SELECT *
FROM customer_sales;
```

---

## Pattern 3 --- CTE + Filtering Aggregate

```sql
WITH customer_sales AS (
    SELECT
        customer_id,
        SUM(amount) AS total_spending
    FROM orders
    GROUP BY customer_id
)
SELECT *
FROM customer_sales
WHERE total_spending > 100000;
```

---

## Pattern 4 --- CTE + JOIN

```sql
WITH customer_sales AS (
    SELECT
        customer_id,
        SUM(amount) AS total_spending
    FROM orders
    GROUP BY customer_id
)
SELECT
    c.customer_name,
    cs.total_spending
FROM customers AS c
JOIN customer_sales AS cs
    ON c.customer_id = cs.customer_id;
```

---

## Pattern 5 --- Multiple CTEs

```sql
WITH sales AS (
    ...
),
order_counts AS (
    ...
),
averages AS (
    ...
)
SELECT ...
FROM sales
JOIN order_counts ...
JOIN averages ...;
```

---

## Pattern 6 --- CTE → Aggregate → Compare

This is one of the most important analytical patterns in the project:

```text
Raw Data
   ↓
CTE
   ↓
Calculate metric
   ↓
Another calculation
   ↓
Compare
   ↓
Business answer
```

For example:

> Which customers spend more than the average customer?

This is really an **analytical thinking problem**. The CTE provides a clean way to break the problem into stages.

---

# 🗺️ CTE Learning Roadmap

The CTE curriculum is intentionally progressive:

---

Level Questions Focus

---

🟢 Beginner 1--30 Basic CTEs,
aggregation, joins,
multiple CTEs

🟡 Intermediate 31--60 Multi-stage
analytics, complex
business logic

🔴 Advanced 61--90 Complex analytical
pipelines and
real-world SQL
problems

---

Window functions are kept separate from this CTE curriculum unless a particular advanced problem genuinely requires them.

---

# 📚 Overall SQL Learning Path

```text
SQL Fundamentals
       ↓
JOINs
       ↓
GROUP BY / HAVING
       ↓
20 SQL Analytical Problems ✅
       ↓
🟢 30 CTE Beginner Problems ← YOU ARE HERE
       ↓
🟡 30 CTE Intermediate
       ↓
🔴 30 CTE Advanced
       ↓
Window Functions
       ↓
Advanced Analytics SQL
```

The objective is to develop the habit of thinking about SQL as a **series of analytical steps**, rather than trying to write one giant query.

---

# 📁 Project Structure

```text
CTE_Practice/
│
├── 00_schema_design.sql
└── README.md
```

The SQL file contains the database creation, table definitions, relationships, and sample data used by all 30 exercises.

---

# 🚀 How to Use This Project

### 1. Create the database

Open `00_schema_design.sql` in **SQL Server Management Studio (SSMS)** or another SQL Server-compatible environment and execute the script.

### 2. Confirm the database

```sql
USE CTE_Practice_DB;
GO
```

### 3. Check the tables

```sql
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM order_items;
```

### 4. Start with Question 1

Write your own CTE solution before looking for help.

### 5. Progress sequentially

Complete:

```text
1 → 5
   ↓
6 → 10
   ↓
11 → 15
   ↓
16 → 20
   ↓
21 → 25
   ↓
26 → 28
   ↓
29 → 30
```

The difficulty increases gradually, so avoid jumping directly to Question 30.

---

# 🎯 Learning Objective

By the end of these 30 exercises, you should be comfortable using CTEs to:

- Filter datasets
- Aggregate data
- Calculate customer metrics
- Count records
- Join CTE results with tables
- Build multiple CTEs
- Compare individual metrics with averages
- Analyze revenue by city
- Analyze revenue by month
- Build simple analytical pipelines
- Break business questions into logical SQL stages

**Next step:** Complete the 30 beginner CTE problems before moving to the **30 Intermediate CTE Practice Questions**. 💪🔥
