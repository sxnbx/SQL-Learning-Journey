# 🔗 SQL JOINS Overview
Joins are one of the most powerful tools in SQL, especially in real-world data analysis. They allow you to combine data from multiple tables based on related columns.
-  Joins return data horizontally by combining columns from multiple tables

## What is a JOIN?
A JOIN is used to combine rows from two or more tables based on a related column (usually a primary and foreign key relationship).

Common types of joins:
- [INNER JOIN](https://github.com/sxnbx/SQL-Learning-Journey/blob/19bf77ddbdfc5f8ccbe825e1b5347121e05049d3/sql_learning/Joins/Inner%20Joins.md)
- LEFT JOIN / RIGHT JOIN
- FULL OUTER JOIN
- SELF JOIN
- CROSS JOIN

Basic Syntax:
```sql
SELECT * 
FROM users
INNER JOIN user_skills
ON users.user_id = user_skills.user_id;
```
--- 

## Notes
###  Primary Key vs. Foreign Key
| Key Type    | Definition                                                              |
| ----------- | ----------------------------------------------------------------------- |
| Primary Key | Uniquely identifies each row in a table. Must be unique and not null.   |
| Foreign Key | Refers to the primary key in another table. Establishes a relationship. |
- Referential Integrity: A foreign key must match an existing primary key value in the referenced table.
- A foreign key does not need to be unique (many rows can reference the same value).

### Types of SQL Joins
**1. INNER JOIN**
- Returns rows with matching values in both tables.
- Filters out non-matching rows.

**2. LEFT JOIN (a.k.a. LEFT OUTER JOIN)**
- Returns all rows from the left table and matching rows from the right table.
- If there's no match, NULLs appear in the right table columns.
  
```sql
SELECT *
FROM orders
INNER JOIN customers
ON orders.customer_id = customers.customer_id;
```
**3. RIGHT JOIN (a.k.a. RIGHT OUTER JOIN)**
  - Returns all rows from the right table and matching rows from the left table.
  - If there's no match, NULLs appear in the left table columns.

**4. FULL OUTER JOIN**
  - Returns all rows from both tables, with NULLs in columns where there is no match.
  - Combines the results of LEFT JOIN and RIGHT JOIN.

**5. SELF JOIN**
  - A table is joined to itself.
  - Useful for comparing rows within the same table (ex., employee-manager relationships).
  - Requires table aliases to differentiate between instances of the same table.

```sql
SELECT A.name AS Employee, B.name AS Manager
FROM employees A
JOIN employees B
ON A.manager_id = B.employee_id;
```
**6. CROSS JOIN**
- Returns the Cartesian product of two tables (every row from table A combined with every row from table B).
- No ON clause is needed.

```sql
SELECT *
FROM colors
CROSS JOIN sizes;
```
![image](https://github.com/user-attachments/assets/e4145158-1038-4a94-82e8-117852eda9fd)


### JOIN vs. UNION
| Operation | Output Style | Description                                                                  |
| --------- | ------------ | ---------------------------------------------------------------------------- |
| `JOIN`    | Horizontal   | Combines **columns** from multiple tables using a related key.               |
| `UNION`   | Vertical     | Combines **rows** from multiple `SELECT` queries (must have same structure). |

- UNION removes duplicates by default; use UNION ALL to include duplicates.
