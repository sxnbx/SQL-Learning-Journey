# USING Clause & UNION
These are advanced but very useful SQL features that help you write cleaner and more flexible queries.

## `USING` in Joins
Normally, when performing joins, we use ON to specify the join condition.
However, if both tables share a column with the same name, we can simplify the syntax using USING().

### ✅ Traditional ON Join
```sql
SELECT c.customer_id, first_name, co.order_id
FROM customers c
LEFT OUTER JOIN customer_orders co
  ON c.customer_id = co.customer_id
ORDER BY c.customer_id, co.order_id;
```
### ✅ Simplified USING Join
```sql
SELECT c.customer_id, first_name, co.order_id
FROM customers c
LEFT OUTER JOIN customer_orders co
  USING (customer_id)
ORDER BY c.customer_id, co.order_id;
```
Note:
- USING works only when both tables have the same column name.
- It's shorter and cleaner, but hides the table prefix in the result — customer_id appears once instead of as c.customer_id or co.customer_id.

## `UNION` vs `UNION ALL`
What is `UNION`?
`UNION` allows you to combine rows from multiple queries (with the same number of columns and compatible data types).
This is different from a `JOIN`, which combines columns.

Example of a Bad UNION
```sql
SELECT first_name, last_name
FROM customers

UNION

SELECT product_id, product_name
FROM products;
```
- This technically works only if the data types match, but it's bad practice — you're mixing customer and product data in one table.

### Labeling Customers by Category
Let’s say we want to group customers into categories using `UNION`.
1. Label "Old" Customers
```sql
SELECT first_name, last_name, "Old" AS label
FROM customers
WHERE YEAR(birth_date) < 1950
```
2. Add "Good Tipper" Category\
```sql
SELECT first_name, last_name, "Old" AS label
FROM customers
WHERE YEAR(birth_date) < 1950

UNION

SELECT first_name, last_name, "Good Tipper"
FROM customers c
JOIN customer_orders co
  ON c.customer_id = co.customer_id
WHERE tip > 3
```
3. Add "Big Spender" Category
```sql
SELECT first_name, last_name, "Old" AS label
FROM customers
WHERE YEAR(birth_date) < 1950

UNION

SELECT first_name, last_name, "Good Tipper"
FROM customers c
JOIN customer_orders co
  ON c.customer_id = co.customer_id
WHERE tip > 3

UNION

SELECT first_name, last_name, "Big Spender"
FROM customers
WHERE total_money_spent > 1000

ORDER BY first_name, last_name;
```
- 💡 This way, you can categorize people based on different criteria while keeping the data in separate logical silos.

- ### UNION vs UNION ALL
- | Feature            | `UNION`                        | `UNION ALL`                      |
| ------------------ | ------------------------------ | -------------------------------- |
| Removes duplicates | ✅ Yes (default behavior)       | ❌ No                             |
| Keeps all rows     | ❌ Only unique rows             | ✅ All rows, including duplicates |
| Performance        | Slightly slower (deduplicates) | Faster (no deduplication)        |

Example:
```sql
SELECT first_name, last_name, "Old" AS label
FROM customers
WHERE YEAR(birth_date) < 1950

UNION ALL

SELECT first_name, last_name, "Old" AS label
FROM customers
WHERE YEAR(birth_date) < 1950;
```
- This will return duplicate rows — one for each time the customer matches.








