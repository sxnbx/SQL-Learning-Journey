# 🧠 SQL Notes: SELECT Statements — Basics and Examples

---

## 📌 Basic SELECT Statement

Use `SELECT` to retrieve specific columns from a table.
SELECT is used to retrieve specific columns from a table.

- Example: You can choose to view columns like last_name, first_name, birth_date, phone, city, state, and total_money_spent.
You can also perform arithmetic operations in SELECT. For instance:
    - (total_money_spent + 100) * 10 will calculate a new value based on the existing column and can be given a new name using AS adjusted_spending.

- Note: Arithmetic inside SELECT follows the PEMDAS order of operations:
    - Parentheses → Exponents → Multiplication/Division → Addition/Subtraction

### ✅ Example:
```sql
SELECT 
    last_name, 
    first_name, 
    birth_date, 
    phone, 
    city, 
    state,
    total_money_spent,
    (total_money_spent + 100) * 10 AS adjusted_spending
FROM customers;
```

## 🆚 SELECT vs SELECT DISTINCT
- Regular SELECT
    - Returns all values, including duplicates
    - For example: You may see the same state (e.g., "Texas") appear multiple times

```sql
SELECT state
FROM customers;
```
- SELECT DISTINCT
    - Removes duplicate values from the result set
    - With SELECT DISTINCT  each state appears only once
 
```sql
SELECT DISTINCT state
FROM customers;
```

- SELECT *
    - Returns all columns and all rows in the table
    - This will show every detail about each customer — e.g., both "Dallas, TX","Austin, TX", phone number, age, etc. entries will appear
```sql
SELECT *
FROM customers;
```
- DISTINCT with Multiple Columns
    - Returns unique combinations of the selected columns
    - Only unique city-state pairs are returned. So even if "Texas" appears in multiple rows, only different cities will be shown once.
    - Note:
        - DISTINCT applies to the combination of all selected columns — not each column individually.
 ```sql
SELECT DISTINCT city, state
FROM customers;
```

