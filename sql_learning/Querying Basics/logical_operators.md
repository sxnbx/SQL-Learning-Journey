# 🌱 SQL Notes: Logical Operators (`AND`, `OR`, `NOT`)

Logical operators in SQL allow you to **filter data more precisely** by combining multiple conditions in the `WHERE` clause.

These operators are used to **control which rows** appear in your result set based on whether the conditions you specify are true or false.

---

## Operator Overview

| Operator | Description                                                                 |
|----------|-----------------------------------------------------------------------------|
| `AND`    | Returns rows where **both** conditions are true.                            |
| `OR`     | Returns rows where **at least one** condition is true.                      |
| `NOT`    | Reverses the condition; returns rows where the condition is **not true**.   |

---

## Examples and Use Cases

### 1️⃣ Get All Customers (No Filtering)

```sql
SELECT *
FROM customers;
```
- This is your basic query showing every row and column from the customers table.
- Used when you want to view all the data.

### 2️⃣ Use AND: Customers from Pennsylvania AND spent more than $1,000

```sql
SELECT *
FROM customers
WHERE state = 'PA' AND total_money_spent > 1000;
```
- Both conditions **must be** true
- This filters for customers in PA who also spent more than $1,000!
- If a customer lives in PA but does not spend more than $1,000, they will NOT be shown in the output

### 3️⃣ Use OR: Customers from Pennsylvania OR spent more than $1,000
```sql
SELECT *
FROM customers
WHERE state = 'PA' OR total_money_spent > 1000;
```
- At least one condition must be true
- Will return customers in PA **OR** anyone else who spent over $1,000
- If a customer lives in PA but does not spend more than $1,000, they WILL be shown in the output

### 4️⃣ Combine OR and AND: Customers from PA or New York AND spent over $1,000
```sql
SELECT *
FROM customers
WHERE (state = 'PA' OR city = 'New York') AND total_money_spent > 1000;
```
- Parentheses ensure the OR is evaluated before the AND. Remember, order of operations matter
- Only returns:
   - Customers in PA or the city New York,
   - But only if they spent over $1,000.
### 5️⃣ Grouped Logic:
Customers who either:
- Live in PA **AND** spent more than $1,000 **OR** were born after January 1, 1998
```sql
SELECT *
FROM customers
WHERE (state = 'PA' AND total_money_spent > 1000)
   OR birth_date > '1998-01-01';
```
- Combines AND, OR, and parentheses to structure logic clearly

### 6️⃣ Use NOT: Customers not from Pennsylvania
When finding what is NOT the condition, there are two syntaxes that represent NOT.
- 'NOT'
- '!='
```sql
SELECT *
FROM customers
WHERE NOT state = 'PA';

SELECT *
FROM customers
WHERE state != 'PA';
```
- Both will edclude customers whose not from PA

### 7️⃣ Customers who did NOT spend more than $1,000
```sql
SELECT *
FROM customers
WHERE NOT total_money_spent > 1000;
```
- Filters for customers who spent $1,000 or less

### 8️⃣ Complex NOT: Customers who did NOT (spend > $1,000 AND live in Texas)
```sql
SELECT *
FROM customers
WHERE NOT (total_money_spent > 1000 AND state = 'TX');
```
- Returns everyone except customers in Texas who spent more than $1,000

---

## ✅ Summary
- Use AND when you want all conditions to be true
- Use OR when just one condition needs to be true
- Use NOT to exclude rows that meet a certain condition
- Parentheses () help group conditions and control order of logic
- SQL follows Boolean logic, so practice using different combinations
