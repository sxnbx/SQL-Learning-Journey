# Window Functions: Lag and Lead
```sql
-- LAG() and LEAD() are window functions in SQL that provide a way to access data from a different row in the same result set without using a self join. They are often used in data analysis to compare the current row with the previous or next row

-- LAG() function fetches the value from a row that is a certain number of rows before the current row within the same result set. It's useful when you want to compare a value in a row with a value in a preceding row

-- LEAD () function fetches the value from a row that is a certain number of rows after the current row within the same result set 

SELECT *,
LAG(salary) OVER(),
LEAD(salary) OVER()
FROM employees
;

SELECT *,
LAG(salary) OVER(PARTITION BY department ORDER BY employee_id)
FROM employees
; -- How can this be used? What if we want to see the pay gap from employee who makes the next amount more than them

SELECT *, lag_column - salary AS pay_discrepancy
FROM
(SELECT *,
LAG(salary) OVER(PARTITION BY department ORDER BY employee_id) AS lag_column
FROM employees) AS lag_table
;

-- we can do the same thing with lead

SELECT *, lag_column - salary AS pay_discrepancy
FROM
(SELECT *,
lead(salary) OVER(PARTITION BY department ORDER BY employee_id) AS lag_column
FROM employees) AS lag_table
;

SELECT *, IF(salary > lag_column, 'More', 'Less')
FROM
(SELECT *,
lead(salary) OVER(PARTITION BY department ORDER BY employee_id) AS lag_column
FROM employees) AS lag_table
;
