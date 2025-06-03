# 🌱 SQL `BETWEEN` Operator – Study Notes

This will cover the `BETWEEN` operator in SQL, which is super helpful when you want to filter values within a range without having to write long `>= AND <=` conditions.




## 🧠 What is the `BETWEEN` operator?

The `BETWEEN` operator selects values **within a given range**, and yes—it includes the boundary values.

---

### ✅ Regular Way vs `BETWEEN`

```sql
-- Long way
SELECT *
FROM customers
WHERE total_money_spent >= 500 AND total_money_spent <= 1000;

-- Cleaner way
SELECT *
FROM customers
WHERE total_money_spent BETWEEN 500 AND 1000;
```

### ⚠️ Order Matters!
When using `BETWEEN`, the lower value must come first, just like how AND works. If you flip the range, your query won’t return the correct results (or may return none at all).

```sql
-- ✅ This works
SELECT *
FROM customers
WHERE total_money_spent BETWEEN 500 AND 1000;

-- ❌ This does NOT work as expected
SELECT *
FROM customers
WHERE total_money_spent BETWEEN 1000 AND 500;
```

### 📅 Date Example with BETWEEN
You can also use BETWEEN with dates!
```sql
SELECT *
FROM customers
WHERE birth_date BETWEEN '1990-01-01' AND '2020-01-01';
```
- This returns all customers born between January 1, 1990, and January 1, 2020, including both dates.

### 🔤 Alphabetical Ranges
You can even use BETWEEN with text (like cities), but it only looks at alphabetical order (starting characters).
```sql
SELECT *
FROM customers
WHERE city BETWEEN 'D' AND 'S';
```
This returns cities that start with letters between D and S alphabetically.

✅ Examples included:
- Dallas
- Richmond
- Seattle
- San Diego
- Sacramento

❌ Not Included:
- SCville → Because 'SC' is after 'S' alphabetically

⚠️ Weird edge case: 'SC' > 'S', so some values starting with 'S' may be excluded.

## Sample Output (Mock Data)
Let’s pretend our customers' table looks like this:
| customer\_id | first\_name | total\_money\_spent | birth\_date | city      |
| ------------ | ----------- | ------------------- | ----------- | --------- |
| 1            | Kevin       | 850                 | 1995-05-21  | Dallas    |
| 2            | Kelly       | 1200                | 1989-11-30  | Seattle   |
| 3            | Frodo       | 500                 | 2001-01-01  | San Diego |
| 4            | Luna        | 750                 | 2005-09-12  | Richmond  |
| 5            | Sam         | 300                 | 1993-06-17  | Boston    |

### Query Example
```sql
SELECT *
FROM customers
WHERE total_money_spent BETWEEN 500 AND 1000;
```

### Output:
| customer\_id | first\_name | total\_money\_spent | birth\_date | city      |
| ------------ | ----------- | ------------------- | ----------- | --------- |
| 1            | Kevin       | 850                 | 1995-05-21  | Dallas    |
| 3            | Frodo       | 500                 | 2001-01-01  | San Diego |
| 4            | Luna        | 750                 | 2005-09-12  | Richmond  |

### Explanation
This SQL query selects all rows from the `customers` table where the value in the `total_money_spent` column is between 500 and 1000, inclusive.

In other words:
- It will include values that are exactly 500 or 1000.
- It will also include all values between 500 and 1000 (like 750, 850, etc.)

This query helps filter customers who spent a mid-range amount of money, from $500 to $1000. It’s great for segmenting customers by spending behavior or identifying your "middle-tier" customers for marketing, analysis, or outreach.

---

## Summary
- The BETWEEN operator is a shorthand for selecting values within a range
- It's inclusive, meaning the endpoints are included
- Works with numbers, dates, and even text (alphabetically)
- Cleaner and more readable than writing >= AND <= conditions

## 🌍 Real-World Uses
- Business & Marketing
  - Filter customers who spent between $500 and $1000 to target with a specific offer
  - Find users born between certain dates to personalize messaging for different age groups.
- Finance
  - Identify transactions between two dates for audits or reports
  - Detect payments within a certain amount range for fraud checks
- Inventory & Sales
  - Select products priced between $50 and $100 for a discount campaign
  - Track orders placed between two specific dates (e.g., holiday seasons)
- HR & Hiring
  - Filter applicants whose scores fall between two values.
  - List employees hired between specific years
