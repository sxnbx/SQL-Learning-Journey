#  SQL: `GROUP BY` Clause
The `GROUP BY` clause is used to organize rows into groups based on the values in one or more columns. It’s especially useful when combined with aggregate functions like `SUM()`, `AVG()`, `COUNT()`, etc.

---
## Basic Syntax
```sql
SELECT column_name, AGGREGATE_FUNCTION(column_name)
FROM table_name
GROUP BY column_name;
```

### ✅ Example 1: Total Tips per Customer
```sql
USE bakery;

SELECT customer_id, SUM(tip) AS total_tip
FROM customer_orders
GROUP BY customer_id;
```
Explanation:
- This groups all orders by customer_id and adds up their tips. Each row in the result represents one customer and their total tips given.

### ✅ Example 2: Average Order Total per Product
```sql
SELECT product_id, AVG(order_total) AS avg_order_total
FROM customer_orders
GROUP BY product_id
ORDER BY avg_order_total DESC;
```
Explanation:
- This shows the average order value for each product, sorted from highest to lowest.

---

## Summary
| Feature     | Description                                  |
| ----------- | -------------------------------------------- |
| Aggregation | Summarize rows by group                      |
| Insights    | Useful for reports, dashboards, and KPIs     |
| Flexibility | Combine with `SUM()`, `AVG()`, `MAX()`, etc. |

## Real World Applications
- Sales tracking: Total sales per product or customer.
- Restaurant orders: Average spending per dish.
- Inventory: Grouping orders or restocks by item.
