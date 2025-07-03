# SQL Joins: Cross & Natural Join
These are two special types of joins. While they might not be as commonly used as INNER JOIN or LEFT JOIN, they are important to understand — especially when you're learning SQL.

## CROSS JOIN
A CROSS JOIN returns the Cartesian product of two tables.
In simple terms: every row from the first table is combined with every row from the second table.

```sql
SELECT c.customer_id, c.first_name, co.customer_id, co.order_id
FROM customers c
CROSS JOIN customer_orders co
ORDER BY c.customer_id;
```
📌 This query returns every possible combination of a customer and an order — regardless of whether they match.

🧠 Useful for:
- Generating test data
- Creating pairing combinations (e.g., all customer–product pairs)
⚠️ Be careful! If customers has 5 rows and customer_orders has 10 rows, the result will have 5 × 10 = 50 rows.

## NATURAL JOIN
A NATURAL JOIN automatically joins tables based on columns with the same name in both tables.

Manual JOIN (recommended)
```sql
SELECT *
FROM products p
JOIN customer_orders co
  ON p.product_id = co.product_id
ORDER BY p.product_id;
```
- This is clear and easy to control. You specify the column the join is based on (product_id in this case).

Natural JOIN (Not Recommended)
```sql
SELECT *
FROM products p
NATURAL JOIN customer_orders co
ORDER BY p.product_id;
```
Why you should avoid NATURAL JOIN:
- It joins on all columns with matching names, which may be unexpected.
- In real-world databases, tables often have many columns (50–100+), so unintended joins can happen.
- It’s hard to debug and makes your code less readable and predictable.

👎 Not suitable for complex or production-level databases.

## 💬 Summary
| JOIN Type      | Description                                                                | Use Case                                      |
| -------------- | -------------------------------------------------------------------------- | --------------------------------------------- |
| `CROSS JOIN`   | Combines every row from one table with every row from another              | Generating combinations or test data          |
| `NATURAL JOIN` | Joins tables by matching all columns with the same names **automatically** | Only for very simple tables (not recommended) |

