# Window Functions: Rank and Dense Rank

```sql
SELECT *
FROM employees
;

SELECT *,
RANK() OVER()
FROM employees
;

SELECT *,
RANK() OVER(PARTITION BY department)
FROM employees
; -- The output will still have 1's because RANK is dependance on ORDER BY we have to put an order, in order for it to know how to rank things

SELECT *,
RANK() OVER(PARTITION BY department ORDER BY salary)
FROM employees
; -- if we have multiple of the same valid at the next opportunity or unque value it will skip 1,2,3,3,5

-- Let's find the top 3 employees with the highest pay for each department

SELECT *
FROM ( SELECT *,
RANK() OVER(PARTITION BY department ORDER BY salary DESC) as rank_row
FROM employees) AS ranked
WHERE rank_row < 3
;
