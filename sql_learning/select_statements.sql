-- ===================================================
-- 🧠 SELECT STATEMENTS: Basics and Examples
-- ===================================================

-- Select specific columns from the customers table
SELECT 
    last_name, 
    first_name, 
    birth_date, 
    phone, 
    city, 
    state,
    total_money_spent,
    (total_money_spent + 100) * 10 AS adjusted_spending
FROM customers;

-- 🔎 Note:
-- Arithmetic operations inside SELECT follow PEMDAS
-- (Parentheses, Exponents, Multiplication, Division, Addition, Subtraction)

-- ===================================================
-- 🆚 SELECT vs SELECT DISTINCT
-- ===================================================

-- Regular SELECT returns all values (including duplicates)
SELECT state
FROM customers;

-- DISTINCT removes duplicates from the result set
SELECT DISTINCT state
FROM customers;

-- Selecting everything (*) shows different cities even within the same state
SELECT * 
FROM customers;
-- e.g., Texas may appear as both Dallas and Austin

-- DISTINCT on multiple columns returns unique combinations only
SELECT DISTINCT city, state
FROM customers;

-- 🔎 Note:
-- DISTINCT applies to the combination of all selected columns,
-- not to each column individually.
