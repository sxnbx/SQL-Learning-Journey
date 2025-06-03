# ⏳ SQL: Date and Time Functions

SQL offers several date and time functions that help you work with timestamps, extract components like year/month/day, and format dates in readable ways. These are especially useful for reporting, filtering by timeframes, and analyzing trends.

---

## Examples
### Get Current Date and Time
```sql
-- Get the exact current date and time
SELECT NOW(); 
```
```sql
-- Get current date and/or time separately
SELECT NOW(), 
       CURDATE(),  -- Only the current date (no time)
       CURTIME();  -- Only the current time (no date)
```
📌 Use case: These are helpful for logging when reports are run or when orders are placed.

### Extract Specific Date Parts
```sql
-- Extract year, month, and day from current date/time
SELECT YEAR(NOW()), MONTH(NOW()), DAY(NOW());
```
- This could also be used to filter data
```sql
-- Find customers born in the current year
SELECT *
FROM customers
WHERE YEAR(birth_date) = YEAR(NOW());
```
```
-- Get orders from last year
SELECT *
FROM customer_orders
WHERE YEAR(order_date) = YEAR(NOW()) - 1;

-- Get orders from 3 years ago (e.g., 2022 if it's 2025)
SELECT *
FROM customer_orders
WHERE YEAR(order_date) = YEAR(NOW()) - 3;
```

### Get Day and Month Names
```sql
-- Return the name of the current day
SELECT DAYNAME(NOW());  -- Example: 'Tuesday'
```
```sql
-- Add day and month names to order data
SELECT order_date, 
       DAYNAME(order_date) AS Day_Name,
       MONTHNAME(order_date) AS Month_Name
FROM customer_orders;
```
📌 Use case: Useful for time-series analysis (ex., "Do customers order more on Mondays or Fridays?").

### Format Dates for Reports
```sql
-- Show raw birth dates
SELECT birth_date FROM customers;
```
Format: 'Month Day Year'
```sql
-- Format date as 'Month Day Year' (e.g., 'January 01 2000')
SELECT birth_date, 
       DATE_FORMAT(birth_date, '%M %d %Y') AS Formatted_Full
FROM customers;
```
Format: '01 01 2000'
```sql
-- Format date as 'MM DD YYYY' (e.g., '01 01 2000')
SELECT birth_date, 
       DATE_FORMAT(birth_date, '%m %d %Y') AS Numeric_Format
FROM customers;
```
Format Date With Dashes
```sql
-- Format date with dashes
SELECT birth_date, 
       DATE_FORMAT(birth_date, '%m-%d-%Y') AS Dashed_Format
FROM customers;
```

---
## Summary Table
| Function                     | Purpose                          | Example                               | Output (Example)      |
| ---------------------------- | -------------------------------- | ------------------------------------- | --------------------- |
| `NOW()`                      | Current date and time            | `NOW()`                               | `2025-06-03 17:23:01` |
| `CURDATE()` / `CURTIME()`    | Current date or time only        | `CURDATE()`                           | `2025-06-03`          |
| `YEAR()`, `MONTH()`, `DAY()` | Extract parts of a date          | `YEAR(NOW())`                         | `2025`                |
| `DAYNAME()`, `MONTHNAME()`   | Get weekday/month name from date | `DAYNAME('2025-06-03')`               | `Tuesday`             |
| `DATE_FORMAT()`              | Format date display              | `DATE_FORMAT(birth_date, '%M %d %Y')` | `June 03 2025`        |

## Real-World Application
- Reporting: Timestamp when a report was generated.
- Trend Analysis: See if users order more on weekends vs weekdays.
- Filtering: Pull sales data from the last year or specific months.
- Formatting: Prepare date fields for human-readable dashboards or exports.


