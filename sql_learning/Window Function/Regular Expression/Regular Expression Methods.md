# Regular Expression: Methods LOOK AT THE SITE

```sql

SELECT *
FROM customers
;


-- Output customers with the letter k in their first name
SELECT *
FROM customers
WHERE first_name LIKE '%k%'
;
-- Both with same output
SELECT *
FROM customers
WHERE first_name REGEXP 'k'
;

-- Regex Replace Method
SELECT first_name, REGEXP_REPLACE(first_name,'a','b')
FROM customers -- Replacing all a with b
;

SELECT first_name, REGEXP_LIKE(first_name,'a') -- the output will either be a 0 or a 1, a 1 will return if the letter a is contain is a customer's firstname
FROM customers 
;

SELECT first_name, REGEXP_INSTR(first_name,'a') -- kinda using LOCATE, finding what position will a be in every customer's name
FROM customers
;

SELECT first_name, REGEXP_SUBSTR(first_name,'char') -- if it finds the 'char' it will pull it
FROM customers
;
