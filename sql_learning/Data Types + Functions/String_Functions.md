# 🔤 SQL: String Functions

String functions help you clean, format, and extract text data in SQL. These are especially useful when working with names, emails, addresses, phone numbers, or any column that contains text.

---
## Examples
### `LENGTH()`
Returns the number of characters in a string.
```sql
SELECT LENGTH('sky');  -- Result: 3

-- Get length of first names
SELECT first_name, LENGTH(first_name) AS Length_First
FROM customers
ORDER BY LENGTH(first_name);
```

### Case Conversion: `UPPER()`/`LOWER()`
```SQL
-- Convert to uppercase
SELECT first_name, UPPER(first_name)
FROM customers;

-- Convert to lowercase
SELECT first_name, LOWER(first_name)
FROM customers;

-- Show both
SELECT first_name, UPPER(first_name), LOWER(first_name)
FROM customers;
```

###  `TRIM()`,`LTRIM()`,`RTRIM()`
Removes unwanted whitespace from strings.
```sql
-- Trim spaces from both sides
SELECT TRIM('    sky   ');  -- Result: 'sky'

-- Trim left and right separately
SELECT '   sky  ', LTRIM('   sky  '), RTRIM('   sky   ');

-- Internal spaces remain
SELECT TRIM('I   love   SQL');  -- Result: 'I   love   SQL'
```

### Substrings: `LEFT()`,`RIGHT()`, `SUBSTRING()`
Extract parts of strings
```sql
-- Get the first 4 letters from the left
SELECT LEFT('Alexander', 4);  -- Result: 'Alex'

-- First & last 3 characters of each name
SELECT first_name, LEFT(first_name, 3), RIGHT(first_name, 3)
FROM customers;

-- Get 3 letters starting from position 2
SELECT SUBSTRING('Alexander', 2, 3);  -- Result: 'lex'
```
```sql
-- Extract phone number parts and remove dashes
SELECT phone, 
       SUBSTRING(phone, 1, 3), 
       SUBSTRING(phone, 5, 3), 
       SUBSTRING(phone, 9, 4),
       CONCAT(SUBSTRING(phone, 1, 3), SUBSTRING(phone, 5, 3), SUBSTRING(phone, 9, 4)) AS Cleaned_Phone
FROM customers;
```

### Replace and Locate
Used in data cleaning!
```sql
-- Replace 'a' with 'z' in first names
SELECT REPLACE(first_name, 'a', 'z')
FROM customers;

-- Remove dashes from phone numbers
SELECT REPLACE(phone, '-', '')
FROM customers;

-- Find the position of 'x' in a word
SELECT LOCATE('x', 'Alexander');  -- Result: 3

-- Find 'Mic' in first names
SELECT first_name, LOCATE('Mic', first_name)
FROM customers;
```

### `CONCAT()`
Combines two or more strings
```sql
SELECT CONCAT('Alex', ' Freberg');  -- Result: 'Alex Freberg'
```

---

## Summary
| Function        | Purpose                            | Example                     | Output          |
| --------------- | ---------------------------------- | --------------------------- | --------------- |
| `LENGTH(str)`   | Counts characters                  | `LENGTH('SQL')`             | `3`             |
| `UPPER(str)`    | Converts to uppercase              | `UPPER('sql')`              | `SQL`           |
| `LOWER(str)`    | Converts to lowercase              | `LOWER('SQL')`              | `sql`           |
| `TRIM(str)`     | Removes leading/trailing spaces    | `TRIM('  sql ')`            | `'sql'`         |
| `LEFT(str, n)`  | Gets first `n` characters          | `LEFT('SQL', 2)`            | `'SQ'`          |
| `RIGHT(str, n)` | Gets last `n` characters           | `RIGHT('SQL', 2)`           | `'QL'`          |
| `SUBSTRING()`   | Gets portion of string by position | `SUBSTRING('SQL', 2, 2)`    | `'QL'`          |
| `REPLACE()`     | Replaces parts of a string         | `REPLACE('a-b', '-', '')`   | `'ab'`          |
| `LOCATE()`      | Finds position of substring        | `LOCATE('L', 'SQL')`        | `3`             |
| `CONCAT()`      | Combines multiple strings          | `CONCAT('Hello', ' World')` | `'Hello World'` |


## Real-World Applications
- Clean user inputs: Remove extra spaces, standardize casing for names or emails.
- Phone number formatting: Strip dashes or extract area codes.
- Customer personalization: Format names (e.g., UPPER(last_name)).
- Data matching: Use SUBSTRING and LOCATE for partial lookups.
