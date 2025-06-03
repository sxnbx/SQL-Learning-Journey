# SQL: Conditional Local (`IF` and `CASE`)
Conditional logic in SQL lets you make decisions within your queries based on values in your data. This is especially helpful for categorizing, creating dynamic columns, or applying business rules.

---

## Examples
### `IF()` Function
The basic syntax:
```sql
IF(condition, value_if_true, value_if_false)
```
**📌 Example 1: Simple Labeling**
```sql
SELECT tip,
       IF(tip > 1, 'Amazing', 'Cheap...') AS Tip_Feedback
FROM customer_orders;
```
- If the tip is more than $1, it shows "Amazing"; otherwise, "Cheap..."

**📌 Example 2: Business Logic**
```sql
SELECT tip,
       IF(tip > 2, order_total * 0.75, order_total * 1.1) AS new_total
FROM customer_orders;
```
-  If the tip is greater than $2, apply a 25% discount. If not, apply a 10% tax.

### `CASE` Statement
Use `CASE` when you have multiple conditions to check.

**Basic Syntax:**
```sql
CASE
  WHEN condition1 THEN result1
  WHEN condition2 THEN result2
  ...
  ELSE default_result
END
```
**📌 Example 1: Stock Status**
```sql
SELECT units_in_stock,
       CASE
         WHEN units_in_stock < 20 THEN 'ORDER NOW'
         WHEN units_in_stock BETWEEN 21 AND 50 THEN 'Check in 3 days'
         ELSE 'In Stock'
       END AS Order_Status
FROM products;
```
- Categorize stock levels based on quantity
  
**📌 Example 2: Order Activity Over Time**
```sql
SELECT order_id,
       order_date,
       CASE
         WHEN YEAR(order_date) = YEAR(NOW()) THEN 'Active'
         WHEN YEAR(order_date) = YEAR(NOW()) - 1 THEN 'Last Year'
         WHEN YEAR(order_date) = YEAR(NOW()) - 2 THEN '2 Years Ago'
         WHEN YEAR(order_date) = YEAR(NOW()) - 3 THEN '3 Years Ago'
         ELSE 'Archived'
       END AS Years
FROM customer_orders;
```
- Dynamically categorize orders by years for reporting purposes

---
## Summary
| Feature | Function         | Use Case Example                        |
| ------- | ---------------- | --------------------------------------- |
| `IF()`  | 2-option logic   | Label tips as "Amazing" or "Cheap"      |
| `IF()`  | Numeric decision | Apply tax or discount based on tip size |
| `CASE`  | Multi-logic      | Label stock urgency levels              |
| `CASE`  | Time comparison  | Categorize orders by year               |

## Real-World Applications
- E-commerce: Label stock levels for inventory teams.
- Customer Service: Flag tips for employee recognition.
- Finance/Reporting: Categorize time-based data like orders or transactions.
- Marketing: Offer discounts or assign customer tiers based on spending.
