# Subqueries in Select and Form LOOK AT THE WEBSITE

```sql
SELECT *
FROM ordered_items
;


SELECT product_id, 
quantity,
(SELECT AVG(quantity)
	FROM ordered_items) avg_quantity
FROM ordered_items
;

SELECT product_id, 
quantity,
(SELECT SUM(quantity)
	FROM ordered_items)sum_quantity,
(quantity/(SELECT SUM(quantity)
	FROM ordered_items) * 100) percent_of_quantity
FROM ordered_items
;

-- FROM
SELECT *
FROM ordered_items
;

SELECT product_id, avg_quantity
FROM (SELECT product_id, 
quantity,
(SELECT AVG(quantity)
	FROM ordered_items) avg_quantity
FROM ordered_items) AS avg_quant -- we have to have an alais for the table
;
