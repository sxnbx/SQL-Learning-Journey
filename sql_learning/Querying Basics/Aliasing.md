# 🌱 SQL: Aliasing
Aliasing lets you rename columns or tables in SQL query outputs without changing the original database structure. It improves readability, makes expressions more understandable, and helps shorten long table names.

---

### Column Aliasing
Change the name of a column in your output, especially useful for:
- Making results easier to read
- Giving computed columns a label
- Matching specific formatting in reports

```sql
-- Rename columns in the result set
SELECT product_name AS 'Goodie Name', units_in_stock AS 'uis'
FROM products;
```
This will display:
- product_name as Goodie Name
- units_in_stock as uis

### Aliasing with Calculations
Give a computed column a readable name
```sql
SELECT units_in_stock * sale_price AS Potential_Revenue
FROM products;
```
This will calculate the total potential revenue per product and show it under the column `Potential_Revenue`

### Table Aliasing
Use table aliases to:
- Shorten long table names
- Improve query readability (especially with joins)

```sql
-- Assign 'p' as an alias for products
SELECT p.units_in_stock * p.sale_price AS Potential_Revenue
FROM products p;
```
This is extremely helpful in JOIN queries or when referencing the same table multiple times.

---

## Summary
- Use AS to rename columns or tables temporarily
- Great for improving output readability or labeling computed columns
- Table aliases help simplify long or repetitive table names
- You don’t need to use AS for table aliases (just the name works)

## 🌍 Real-World Uses
Reporting
- Show client-facing column names like Full Name, Total Cost, Revenue, etc., instead of internal database names like cust_name or sale_amt.

Dashboards
- When building a dashboard or visualization, aliases help clean up column headers.

Team Collaboration
- Makes queries easier to understand by others (e.g., AVG(score) AS average_score).

Analytics
- Give meaningful names to calculated metrics: ex., profit_margin, engagement_rate, Potential_Revenue
  
Complex Queries
- Table aliases reduce clutter when joining multiple table

