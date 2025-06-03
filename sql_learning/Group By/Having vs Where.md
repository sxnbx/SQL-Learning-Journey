# SQL: HAVING vs WHERE Clause

Both `WHERE` and `HAVING` filter data, but they are used at different stages in a SQL query's execution.

| Clause   | Purpose                              | Used With                                 |
| -------- | ------------------------------------ | ----------------------------------------- |
| `WHERE`  | Filters **rows** before grouping     | Any column (raw data)                     |
| `HAVING` | Filters **groups** after aggregation | Aggregate results like `SUM()`, `COUNT()` |

---

## Notes

### Query Execution Order (Simplified)
FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY

### Example 1: Total Tips Per Customer
```sql
SELECT customer_id, SUM(tip) AS total_tips
FROM customer_orders
GROUP BY customer_id;
```
How much tip money has each customer given in total?
- SUM(tip) adds up all tips per customer_id.
- GROUP BY customer_id ensures that tips are calculated per customer.
- The result will look like:

| customer\_id | total\_tips |
| ------------ | ----------- |
| 1            | 3.50        |
| 2            | 5.00        |
| 3            | 10.00       |
This is the foundation query with no filtering

**❌ Incorrect: Filtering With WHERE on Aggregated Value**
```sql
SELECT customer_id, SUM(tip) AS total_tips
FROM customer_orders
WHERE total_tips > 5  -- ❌ This will cause an error!
GROUP BY customer_id;
```
What’s wrong here?
- You're trying to use total_tips (an alias for SUM(tip)) in the WHERE clause.
- But SQL processes WHERE before SUM() even happens.
- So it throws an error: it doesn't know what total_tips is yet.

**✅ Correct: Use HAVING for Aggregates**
```sql
SELECT customer_id, SUM(tip) AS total_tips
FROM customer_orders
GROUP BY customer_id
HAVING total_tips > 5;
```
- First, SQL calculates total tips per customer (just like Example 1).
- Then it filters out customers after grouping — only keeping those with total_tips > 5.
- 

### Example 2: Filter Based on Total Order Value, Which customers spent more than $40 in total, and how much did they spend?
```sql
SELECT customer_id, SUM(order_total) AS total
FROM customer_orders
GROUP BY customer_id
HAVING SUM(order_total) > 40
ORDER BY total;
```
- For each customer, calculate their total spending (using SUM(order_total)).
- Then, only keep customers who spent more than $40.
- ORDER BY total arranges the results from smallest to largest total spending (among those who passed the filter).

### Why This Matters
| Task                                          | Use      | Why?                                 |
| --------------------------------------------- | -------- | ------------------------------------ |
| Filter orders placed in the year 2024         | `WHERE`  | You’re filtering **raw row data**    |
| Only show customers who tipped more than \$10 | `HAVING` | You’re filtering **after grouping**  |
| Filter out orders with status = 'cancelled'   | `WHERE`  | Filtering **before any aggregation** |
| Only show products with total sales > \$1000  | `HAVING` | Filtering **after `SUM()`**          |

---

## Summary
| Use This... | When You Want to...                        |
| ----------- | ------------------------------------------ |
| `WHERE`     | Filter rows **before** grouping (raw data) |
| `HAVING`    | Filter rows **after** aggregation          |


## Real World Examples
- Show only customers who spent more than $100 (HAVING)
- Filter out canceled orders (WHERE)
- Identify users who submitted more than 3 feedback entries (HAVING COUNT())
