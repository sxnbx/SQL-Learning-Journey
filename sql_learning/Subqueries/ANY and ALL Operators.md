#Subqueries: ANY and ALL Operators

```sql
-- ALL
SELECT *
FROM ordered_items
;

SELECT MAX(quantity * unit_price) as total_order_price
FROM ordered_items
WHERE shipper_id = 1
;


SELECT shipper_id, order_id, quantity, unit_price, (quantity * unit_price) AS total_order_price
FROM ordered_items
WHERE (quantity * unit_price) > (
	SELECT MAX(quantity * unit_price) as total_order_price
	FROM ordered_items
	WHERE shipper_id = 1)
;
-- these two do the same thing
SELECT shipper_id, order_id, quantity, unit_price, (quantity * unit_price) AS total_order_price
FROM ordered_items
WHERE (quantity * unit_price) > ALL (
	SELECT (quantity * unit_price) as total_order_price
	FROM ordered_items
	WHERE shipper_id = 1)
; -- in the subquery it means ALL OF THE CONDITIONS IN THE SUBQUERY must happen in order for it to be true

SELECT shipper_id, order_id, quantity, unit_price, (quantity * unit_price) AS total_order_price
FROM ordered_items
WHERE (quantity * unit_price) > ANY (
	SELECT (quantity * unit_price) as total_order_price
	FROM ordered_items
	WHERE shipper_id = 1)
;
