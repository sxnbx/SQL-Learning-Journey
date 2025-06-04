# 🔗 SQL: INNER JOIN
An INNER JOIN returns only the rows that have matching values in both tables. This is the most commonly used type of join in SQL and is especially useful when combining data across tables with related keys.

## Basic Syntax
```sql
SELECT *
FROM table1
INNER JOIN table2
    ON table1.column = table2.column;
```
- 💡 Note: Writing JOIN by itself defaults to INNER JOIN

## Notes
### INNER JOIN Between customers and customer_orders
```sql
SELECT *
FROM customers c
JOIN customer_orders co
    ON c.customer_id = co.customer_id
ORDER BY c.customer_id;
```
**Explantation**
- This join matches customers to their respective orders.
- It only returns customers who have placed at least one order.
- Prefixing table names with aliases (c and co) makes complex queries easier to read.

### INNER JOIN Between products and customer_orders
```sql
SELECT p.product_name
FROM products p
JOIN customer_orders co
    ON p.product_id = co.product_id;
```
- You’re connecting each product to the order(s) it was included in.
- Useful for understanding what products are being purchased.
- If the column name (ex, `product_name`) exists in only one of the joined tables, you technically don’t have to prefix it. But it’s best to use the prefix for clarity and to avoid conflicts in larger queries.

### Aggregate Data Example: Total Sales per Product
```sql
SELECT p.product_name, SUM(co.order_total) AS total_sales
FROM products p
JOIN customer_orders co
    ON p.product_id = co.product_id
GROUP BY p.product_name
ORDER BY total_sales;
```
Explanation:
- This query calculates the total revenue per product.
- GROUP BY is necessary because you're using an aggregate function (SUM).
- ORDER BY sorts the results by the total sales (ascending by default).

### INNER JOIN Between suppliers and ordered_items
```sql
SELECT *
FROM suppliers s
JOIN ordered_items oi
    ON s.supplier_id = oi.shipper_id;
```
Explanation:
- This join connects suppliers with the items they have shipped.
- Even though the column names differ (`supplier_id` vs `shipper_id`), they represent the relationship between the tables.
- `shipper_id` is a foreign key pointing to `suppliers.supplier_id`.



