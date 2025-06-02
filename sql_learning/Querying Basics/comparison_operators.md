# 📘 SQL Notes: Comparison Operators

Comparison operators in SQL are used in the `WHERE` clause to **filter data** based on a condition. They compare one value to another and return rows that match the criteria. Think of them as tools that help answer questions like:

- “Which customers tipped more than $5?”
- “Which orders didn’t include a tip?”
- “Who made exactly a $1 tip?”

---

## 🔧 What Are Comparison Operators?

Comparison operators are symbols used to compare values in a table (like numbers, dates, or text). The result of a comparison is always either:

- ✅ **TRUE** – The condition is met, so the row is included.
- ❌ **FALSE** – The condition is not met, so the row is excluded.

---

## 📌 Common SQL Comparison Operators

| Operator   | Description                        | Use Case Example         |
|------------|------------------------------------|--------------------------|
| `=`        | Equal to                           | `tip = 1` (tip is $1)     |
| `<>`       | Not equal to (standard SQL)        | `tip <> 1`               |
| `!=`       | Not equal to (alternative syntax)  | `tip != 1`               |
| `>`        | Greater than                       | `tip > 5` (tip more than $5) |
| `>=`       | Greater than or equal to           | `tip >= 5` (tip $5 or more) |
| `<`        | Less than                          | `tip < 5`                |
| `<=`       | Less than or equal to              | `tip <= 5`               |

> 💡 **Note**: Both `<>` and `!=` mean "not equal to" in most SQL dialects like MySQL and PostgreSQL.

---

## 🧪 Real-World SQL Query Examples

Let’s imagine we are working with a table called `bakery.customer_orders`, which has a `tip` column storing the amount customers tipped.

---

### ✅ 1. Equal To (`=`)

```sql
SELECT *
FROM bakery.customer_orders
WHERE tip = 1;
```
- Returns all rows where the tip was exactly $1
- Useful when you're looking for precise matches

### ❌ 2. Not Equal To (<> or !=)
```sql
-- Option 1: Standard SQL
SELECT *
FROM bakery.customer_orders
WHERE tip <> 1;

-- Option 2: MySQL-friendly
SELECT *
FROM bakery.customer_orders
WHERE tip != 1;
```
- Both queries return orders where the tip was not $1

### 🔼 3. Greater Than (>)
```sql
SELECT *
FROM bakery.customer_orders
WHERE tip > 5;
```
- Returns orders where the tip is **more than** $5, excluding $5
- Interpertion: Customers whose tip was more than $5 are generous tippers

### 🔼 4. Greater Than or Equal To (>=)
```sql
SELECT *
FROM bakery.customer_orders
WHERE tip >= 5;
```
- Returns orders where the tip is $5 or more, including $5
- This is inclusive of the boundary

### 🔽 5. Less Than (<)
```sql
SELECT *
FROM bakery.customer_orders
WHERE tip < 5;
```
- Returns orders where the tip is less than #5, excluding $5
- Used when filtering for smaller values

### 🔽 6. Less Than or Equal To (<=)
```sql
SELECT *
FROM bakery.customer_orders
WHERE tip <= 5;
```
- Returns all orders where the tip is $5 or less, including $5

---

## Summary
- SQL comparison operators help filter rows in a table based on conditions you set
- They are mostly used inside the WHERE clause
- Different operators help answer different types of questions: equal, not equal, more than, or less than
