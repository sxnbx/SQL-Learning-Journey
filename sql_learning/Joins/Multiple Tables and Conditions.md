# 🔗 SQL Joins: Multiple Tables and Conditions

In SQL, a JOIN is used to combine rows from two or more tables based on a related column — usually a foreign key. This is super useful when data is split across different tables.

For example:
You might have a `customers` table and a `customer_orders table`.
You want to see which customer made which order — that’s where joins come in!

## 🧩 Basic JOIN Types
| Join Type         | What It Does                                                            |
| ----------------- | ----------------------------------------------------------------------- |
| `INNER JOIN`      | Only shows rows where there’s a match in **both** tables                |
| `LEFT JOIN`       | Shows **all rows from the left** table, and matched rows from the right |
| `RIGHT JOIN`      | Shows **all rows from the right** table, and matched rows from the left |
| `FULL OUTER JOIN` | Shows **all rows from both** tables, with `NULL` where there’s no match |

## 🧪 Table Setup Example
customer
| customer\_id | first\_name |
| ------------ | ----------- |
| 1            | Alice       |
| 2            | Bob         |
| 3            | Michael     |
| 4            | Kelly       |

customer_orders
| order\_id | customer\_id |
| --------- | ------------ |
| 100       | 1            |
| 101       | 2            |
| 102       | 1            |


### 🔹 INNER JOIN
Returns rows where there’s a match in both tables.
```sql
SELECT c.customer_id, first_name, co.order_id
FROM customers c
JOIN customer_orders co
  ON c.customer_id = co.customer_id
ORDER BY c.customer_id, co.order_id;
```

Output:
| customer\_id | first\_name | order\_id |
| ------------ | ----------- | --------- |
| 1            | Alice       | 100       |
| 1            | Alice       | 102       |
| 2            | Bob         | 101       |

- Only customers with orders are shown.

### 🔹 RIGHT JOIN (aka RIGHT OUTER JOIN)
Returns all orders, with customer info (if available).
If a customer is missing, their info will be NULL.
```sql
SELECT c.customer_id, first_name, co.order_id
FROM customers c
RIGHT JOIN customer_orders co
  ON c.customer_id = co.customer_id
ORDER BY c.customer_id, co.order_id;
```

Output:
| customer\_id | first\_name | order\_id |
| ------------ | ----------- | --------- |
| 1            | Alice       | 100       |
| 1            | Alice       | 102       |
| 2            | Bob         | 101       |
-  In this case, all orders have matching customers, so it's the same as an inner join.

### 🔹 FULL OUTER JOIN
Returns all rows from both tables.
If there's no match, the missing side shows NULL.

MySQL doesn’t support `FULL OUTER JOIN` directly, but you can simulate it using `UNION`:
```sql
SELECT c.customer_id, first_name, co.order_id
FROM customers c
LEFT JOIN customer_orders co
  ON c.customer_id = co.customer_id

UNION

SELECT c.customer_id, first_name, co.order_id
FROM customers c
RIGHT JOIN customer_orders co
  ON c.customer_id = co.customer_id
ORDER BY customer_id, order_id;
```

Output:
| customer\_id | first\_name | order\_id |
| ------------ | ----------- | --------- |
| 1            | Alice       | 100       |
| 1            | Alice       | 102       |
| 2            | Bob         | 101       |
| 3            | Michael     | NULL      |
| 4            | Kelly       | NULL      |
- In this case, since all orders have matching customers and some customers don’t have orders, it looks the same as the LEFT JOIN result. But if there were unmatched orders, they would appear here too.
