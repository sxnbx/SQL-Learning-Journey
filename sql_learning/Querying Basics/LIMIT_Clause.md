# 🌱 SQL Notes: LIMIT Clause – Controlling Query Results
The LIMIT clause in SQL is used to restrict the number of rows returned by a query. This is especially useful when working with large datasets or when you only want a sample of the results.

## Why the 'LIMIT' Clause is Important
- Helps improve query performance by returning only a small portion of the data
- Useful in data previews, dashboards, and pagination (ex., showing 10 results per page on a website)
- Allows you to focus on top values, such as the top 10 spenders or the most recent orders

---

## Basic Syntax
```sql
SELECT column1, column2, ...
FROM table_name
[WHERE conditions]
[ORDER BY column]
LIMIT number;
```
- 'LIMIT' always comes **at the end** of the query

## Examples and Use Cases
### 🔢 Example 1: Return Any 5 Customers Who Spent Over $10,000
```sql
SELECT *
FROM customers
WHERE total_money_spent > 10000
LIMIT 5;
```
- This returns any 5 customers that meet the condition
- No specific order is guaranteed unless you add the ORDER BY function

### 🏆 Example 2: Top 5 Customers by Spending
```sql
SELECT *
FROM customers
ORDER BY total_money_spent DESC
LIMIT 5;
```
- Returns the top 5 highest spenders
- Sorted in descending order (DESC) by total_money_spent

### 🔁 Example 3: Pagination with OFFSET (LIMIT with 2 values)
```sql
SELECT *
FROM customers
ORDER BY total_money_spent DESC
LIMIT 5, 2;
```
- This skips the first 5 rows and returns the next 2 rows
- The first number (5) is the offset (where to start)
- The second number (2) is the count (how many rows to return

This is great for pagination, like showing results for Page 2 (e.g., LIMIT 10, 10 for the next 10 results after the first 10).

## Summary
| Concept                | What It Does                                               |
| ---------------------- | ---------------------------------------------------------- |
| `LIMIT n`              | Returns the **first n rows**                               |
| `ORDER BY ... LIMIT n` | Returns the **top/bottom n rows**, depending on the order  |
| `LIMIT offset, count`  | Skips `offset` rows, returns `count` rows (for pagination) |

##  Real-World Example
If you're building an e-commerce dashboard, you might use the SQL code below to show the top 10 customers for this month.
```sql
SELECT customer_name, total_money_spent
FROM customers
ORDER BY total_money_spent DESC
LIMIT 10;
```
