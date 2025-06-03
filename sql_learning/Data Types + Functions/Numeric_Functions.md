# 📊 SQL: Numeric Functions

Welcome! This section covers numeric functions in SQL, helpful tools that manipulate and format numbers directly within your queries. These are commonly used when dealing with prices, ratings, statistics, and other numerical data.

### What Are Numeric Functions?
Numeric functions are built into SQL tools that allow you to:
- Round numbers (up/down or to specific decimals)
- Remove negative signs
- Format and clean numerical data

They're useful when working with prices, measurements, or anything involving numeric values

---

## Examples Use Cases
### `ROUND()`
Rounds a number to the nearest whole number or to a specific number of decimal places.

```sql
SELECT ROUND(123.456789);      -- Result: 123
SELECT ROUND(123.456789, 2);   -- Result: 123.46
```
```sql
-- Round sale prices to 1 decimal place
SELECT sale_price, ROUND(sale_price, 1)
FROM products;
```

### `CEILING()` or `CEIL()`
Always rounds up to the next whole number
```sql
SELECT CEILING(5.7);  -- Result: 6
SELECT CEILING(5.2);  -- Result: 6
-- Round up sale prices
SELECT sale_price, CEILING(sale_price)
FROM products;
```

### `FLOOR()`
Always round down to the nearest whole number
```sql
SELECT FLOOR(5.1);  -- Result: 5
SELECT FLOOR(5.7);  -- Result: 5
```

### `ABS()`
Return the absolute value of a number (removes the negative sign)
```sql
SELECT ABS(-4.6);  -- Result: 4.6
SELECT ABS(4.6);  -- Result: 4.6
```

---

## Summary Table 
| Function      | Description                       | Example           | Output |
| ------------- | --------------------------------- | ----------------- | ------ |
| `ROUND(x)`    | Rounds to nearest whole number    | `ROUND(4.6)`      | 5      |
| `ROUND(x, d)` | Rounds to `d` decimal places      | `ROUND(4.678, 2)` | 4.68   |
| `CEILING(x)`  | Rounds number **up**              | `CEILING(4.2)`    | 5      |
| `FLOOR(x)`    | Rounds number **down**            | `FLOOR(4.8)`      | 4      |
| `ABS(x)`      | Returns absolute (positive) value | `ABS(-7.1)`       | 7.1    |

## 🌍 Some Real-World Applications
- E-Commerce: Round product prices or clean up sale price decimals
- Finance: Format interest rates, returns, or show total gains/losses with ABS()
- Reporting: Standardize values for clean dashboards and visualizations
- Data Cleaning: Round messy data, remove negatives, or apply thresholds
