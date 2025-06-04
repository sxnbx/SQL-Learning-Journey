# SQL: ROLLUP
`ROLLUP` is an extension of `GROUP BY` that allows you to calculate subtotals and grand totals in your query results.

It’s useful when you want to summarize grouped data and also get a total row at the end, without writing multiple queries or doing math manually.

---

## Notes
### Example !: Total Tips Per Customer (with Grand Total)
```sql
SELECT customer_id, SUM(tip) AS total_tips
FROM customer_orders
GROUP BY customer_id WITH ROLLUP;
```
- Groups all customer tips using SUM(tip) per customer_id.
- The WITH ROLLUP adds an extra row at the bottom:
  - It contains the total of all tips from all customers.
  - In that row, customer_id will be NULL to indicate it’s the rollup row.

**Sample Output:**
| customer\_id | total\_tips |                       |
| ------------ | ----------- | --------------------- |
| 1            | 4.00        |                       |
| 2            | 3.50        |                       |
| 3            | 10.00       |                       |
| **NULL**     | **17.50**   | ← Grand total of tips |

### Example 2: Count of Tips Per Customer (with Rollup)
```sql
SELECT customer_id, COUNT(tip) AS count_tips
FROM customer_orders
GROUP BY customer_id WITH ROLLUP;
```
- Counts how many tips each customer left.
- The ROLLUP row at the end shows the total number of tips left by all customers.
- Again, the customer_id for that row will be NULL.

**Sample Output**
| customer\_id | count\_tips |                        |
| ------------ | ----------- | ---------------------- |
| 1            | 2           |                        |
| 2            | 3           |                        |
| 3            | 4           |                        |
| **NULL**     | **9**       | ← Total number of tips |

---

- You can only use ROLLUP on grouped data (e.g., with GROUP BY).
- The rollup row will always appear last.
- Watch out: if you're displaying results to users, you may want to label the NULL row as “Total” for clarity.

