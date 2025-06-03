# 🌱 SQL LIKE Operator – Pattern Matching Notes

The LIKE operator is used in the WHERE clause to filter rows that match a given pattern. It works with wildcards and is commonly used with text columns like names, emails, or phone numbers.

## Reference 
| Symbol | Meaning                       |
| ------ | ----------------------------- |
| `%`    | Zero, one, or many characters |
| `_`    | Exactly one single character  |


## Examples and Use Cases
### Starts With...
```sql
SELECT *
FROM customers
WHERE first_name LIKE 'K%';
```
- Finds names starting with K (ex., Kevin, Kara, Kelly)
- % means "any characters after K"

### Ends With...
```sql
SELECT *
FROM customers
WHERE first_name LIKE '%n';
```
- Finds names ending in n (ex., John, Megan, Anakin)
- % before the letter means "any characters before n"

### Contains...
```sql
SELECT *
FROM customers
WHERE first_name LIKE '%n%';
```
- Finds names that have n anywhere (ex., Kevin, Luna, Anakin)

### Exact Position Matching
```sql
-- One character before 'n'
WHERE first_name LIKE '_n';

-- Two characters before 'n'
WHERE first_name LIKE '__n';

-- A letter in the middle (e.g., "Tom", "Bob")
WHERE first_name LIKE '_o_';

-- Names ending in "kin" with 3 characters before
WHERE first_name LIKE '___kin';
```

### Combining % and _
```sql
-- Last names starting with 's' and followed by exactly 4 characters
WHERE last_name LIKE 's____%';

-- Phone numbers that start with '975-'
WHERE phone LIKE '975-%';
```

---

## Sample Output (Mock Data)
Let’s say your customers' table contains:
| customer\_id | first\_name | last\_name | phone        |
| ------------ | ----------- | ---------- | ------------ |
| 1            | Kevin       | Smith      | 975-555-1234 |
| 2            | Luna        | Lovegood   | 804-111-2222 |
| 3            | Anakin      | Skywalker  | 975-999-0000 |
| 4            | John        | Snow       | 703-456-7890 |
| 5            | Frodo       | Baggins    | 312-321-5432 |

### Query
```sql
SELECT *
FROM customers
WHERE first_name LIKE '%n';
```

### Output:
| customer\_id | first\_name | last\_name | phone        |
| ------------ | ----------- | ---------- | ------------ |
| 1            | Kevin       | Smith      | 975-555-1234 |
| 3            | Anakin      | Skywalker  | 975-999-0000 |
| 4            | John        | Snow       | 703-456-7890 |

### Explanation
- The query returns all customers whose first_name ends with the letter 'n'
- %n tells SQL to match any characters before 'n'
- Case-insensitive in most databases (like MySQL)

### Summary Table
| Pattern    | Matches Examples  |
| ---------- | ----------------- |
| `'A%'`     | Alice, Adam       |
| `'%son'`   | Jackson, Anderson |
| `'%ar%'`   | Harry, Clara      |
| `'__n'`    | Dan, Ken          |
| `'s____%'` | Smith, Stone      |

---

## 🌍 Why 'LIKE' Is Important
- Helps with fuzzy searching in apps and dashboards
- Ideal when you don’t know the exact value (e.g., partial name, email)
- Used in search boxes, data validation, or customer filtering.

## 💼 Real-World Uses
- CRM systems: Filter names starting with "L"
- E-commerce: Find products with "blue" in the name
- Support tools: Search emails ending in "@gmail.com"
- Telecom apps: Find phone numbers starting with specific area codes
