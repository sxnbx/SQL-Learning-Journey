# Window Functions: Over Clausee + Partition By 

```sql
-- OVER Clause: The OVER clause defines a window or set of rows within the query result set. A window function then computes a value for each row in the window. You can think of it as a moving or sliding window for each row

-- PARTITION BY: The PARTITION BY clause divides the result set produced by the FROM clause into partitions to which the window function is applied. In other words, it creates a "window" for each set of rows sharing the same values of the PARTITION BY clause

-- We want is to show the customer ID their name and how much they're spending and then kind of the max that people are spending as well 
SELECT *
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id
;

SELECT c.customer_id, first_name, order_total
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id
; -- now we want to look at the max order total

-- This will not give us the correct output. It does it give us the max total for the whole column it is doing it based on rows that is why we need OVER and Window Function
SELECT c.customer_id, first_name, order_total, MAX(order_total)
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id
GROUP BY c.customer_id, first_name, order_total
;

-- 2 Versions, will give the same outcome
SELECT c.customer_id, first_name, order_total, MAX(order_total) OVER() AS max_order_total
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id
;

SELECT c.customer_id, first_name, order_total, (SELECT MAX(order_total) OVER() AS max_order_total)
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id
;

-- why does the OVER clause matter: it will allows us to do things subqueries may not


-- PARTITION BY
SELECT c.customer_id, 
first_name, 
order_total, 
MAX(order_total) OVER(PARTITION BY customer_id) AS max_order_total
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id
;

