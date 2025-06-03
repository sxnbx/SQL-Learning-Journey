# SQL: CAST and CONVERT Functions
SQL lets you convert data from one type to another using CAST() and CONVERT(). These are helpful when working with mismatched or inconsistent data types—especially in reporting, filtering, or joining tables.

---

## Notes
### `CAST()`
The `CAST()` function changes a value from one data type to another
```sql
CAST(value AS target_data_type)
```

**📌 Example: Convert Text to DateTime**\
```sql
SELECT CAST("2022-01-01" AS DATETIME);
```
- This turns the string `"2022-01-01"` into a `DATETIME` format

**📌 Example: Convert a Column to DateTime**
```sql
SELECT birth_date,
       CAST(birth_date AS DATETIME) AS Casted_Date
FROM customers;
```
- Even if `birth_date` is already in date format, you can cast it to ensure consistency or prepare for operations that require a specific type

### `CONVERT()`
`CONVERT()` works similarly to `CAST()` but uses a slightly different syntax:
```sql
CONVERT(value, target_data_type)
```

**📌 Example: Use CONVERT for the Same Task**
```sql
SELECT birth_date,
       CAST(birth_date AS DATETIME) AS Casted,
       CONVERT(birth_date, DATETIME) AS Converted
FROM customers;
```
-  Both `CAST` and `CONVERT` return the same result, though `CONVERT()` is more commonly used in SQL Server.

---

## Summary
| Function    | Syntax                 | Description                       |
| ----------- | ---------------------- | --------------------------------- |
| `CAST()`    | `CAST(value AS type)`  | Standard SQL conversion method    |
| `CONVERT()` | `CONVERT(value, type)` | SQL Server-specific, same purpose |

## Real-World Applications
- Cleaning data: Convert string dates to DATETIME before filtering or sorting.
- Reporting: Standardize data types in dashboards (ex., Excel/Power BI exports).
- Joins: Match columns of different types before joining tables.
