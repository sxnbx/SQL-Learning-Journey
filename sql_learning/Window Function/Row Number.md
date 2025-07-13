# Window Functions: Row Number assigns a number to each row

```sql
USE bakery;

SELECT c.customer_id,
first_name,
order_total,
MAX(order_total) OVER(PARTITION BY customer_id) AS max_order_total
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id
;

SELECT c.customer_id,
first_name,
order_total,
ROW_NUMBER() OVER() 
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id
;

SELECT c.customer_id,
first_name,
order_total,
ROW_NUMBER() OVER(PARTITION BY customer_id) 
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id
;

-- rate them lowest to highest
SELECT c.customer_id,
first_name,
order_total,
ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_total ASC) 
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id
;

SELECT *
FROM (
SELECT c.customer_id,
first_name,
order_total,
ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_total ASC) AS row_num
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id
) AS row_table  
WHERE row_num < 3
;
