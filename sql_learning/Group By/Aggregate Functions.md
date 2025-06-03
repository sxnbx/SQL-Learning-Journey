# SQL: Aggregate Functions

Aggregate functions perform calculations on multiple rows of a table and return a single value. These are commonly used with the GROUP BY clause to summarize data.

## Common Aggregate Functions
| Function          | Description                   |
| ----------------- | ----------------------------- |
| `SUM()`           | Adds up all values            |
| `AVG()`           | Calculates average            |
| `MAX()`           | Finds the highest value       |
| `MIN()`           | Finds the lowest value        |
| `COUNT()`         | Counts non-NULL values        |
| `COUNT(DISTINCT)` | Counts unique non-NULL values |

---

## Notes
### Total Tips per Customer
```sql
SELECT customer_id, SUM(tip) AS total_tips
FROM customer_orders
GROUP BY customer_id;
```
- Adds all tips each customer gave

### Maximum Tip per Customer
```sql
SELECT customer_id, MAX(tip) AS biggest_tips
FROM customer_orders
GROUP BY customer_id
ORDER BY biggest_tips;
```
- Finds the largest tip each customer has given

### Minimum Tip per Customer
```sql
SELECT customer_id, MIN(tip) AS smallest_tips
FROM customer_orders
GROUP BY customer_id
ORDER BY smallest_tips;
```
- Finds the smallest tip (including $0) each customer has left

###  How Many Times a Customer Left a Tip
```sql
SELECT customer_id, COUNT(tip) AS count_of_tips
FROM customer_orders
GROUP BY customer_id
ORDER BY count_of_tips;
```
Important Note:
- In this dataset, `0` is used to indicate "no tip" instead of `NULL`. `COUNT()` includes `0`, but ignores `NULL`. That means this is still counts a tip of $0 as valid

## Tip: Understand Your Data Type
### `0` VS `NULL`
```sql
SELECT first_name, last_name, COUNT(phone)
FROM customers
GROUP BY first_name, last_name;
```
- If missing phone = NULL, then COUNT(phone) does not count it.
- If missing phone = '0' or blank string, COUNT(phone) will count it.
- Always check how missing data is stored.

### Count vs Count Distinct
```sql
SELECT product_id, COUNT(tip) AS total_tips, COUNT(DISTINCT tip) AS unique_tip_values
FROM customer_orders
GROUP BY product_id
ORDER BY product_id;
```
- COUNT(tip): total number of tips (including duplicates)
- COUNT(DISTINCT tip): only unique tip amounts

