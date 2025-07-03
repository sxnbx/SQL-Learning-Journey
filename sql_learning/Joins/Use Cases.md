# SQL Join Use Cases
These examples demonstrate how SQL joins are used to analyze product performance, track delivery status, and connect multiple data sources in real-world business scenarios.

###  Use Case 1: Product Profitability & Potential Profit
Goal: Analyze how much profit we make per product and calculate total potential profit (if all units in stock are sold).

```sql
SELECT DISTINCT 
  p.product_name, 
  oi.unit_price, 
  p.sale_price,
  p.units_in_stock,
  (p.sale_price - oi.unit_price) AS profit_per_unit,
  (p.sale_price - oi.unit_price) * p.units_in_stock AS potential_profit
FROM ordered_items oi
JOIN products p
  USING(product_id)
ORDER BY potential_profit DESC;
```
Explanation:
- profit_per_unit: How much we make per unit sold.
- potential_profit: How much we could earn if all units in stock are sold at the sale price.
- USING(product_id): Simplifies the join because both tables share the same column name.

### Use Case 2: Delivery Status and Shipping Info
Goal: Combine shipping and delivery status information for all ordered items.
```sql
SELECT *
FROM ordered_items oi
JOIN supplier_delivery_status sds
  ON oi.status = sds.order_status_id
JOIN suppliers s
  ON oi.shipper_id = s.supplier_id;
```
Explanation:
- Join ordered_items to supplier_delivery_status to get the readable status name (Delivered, Shipped, etc.).
- Then join to suppliers to identify which shipping company handled the order.

### Use Case 3: Delayed Orders (Before 2021)
Goal: Find undelivered orders that were shipped more than 3 years ago (before 2021).
```sql
SELECT 
  oi.order_id, 
  sds.name AS delivery_status, 
  oi.status, 
  oi.shipped_date, 
  s.name AS supplier_name
FROM ordered_items oi
JOIN supplier_delivery_status sds
  ON oi.status = sds.order_status_id
JOIN suppliers s
  ON oi.shipper_id = s.supplier_id
WHERE sds.name <> 'Delivered'
  AND YEAR(shipped_date) < YEAR(NOW()) - 3;
```
Explanation:
- Filters out only orders not marked as "Delivered".
- Targets those that were shipped more than 3 years ago, helping us identify overdue or lost shipments.
- Useful for auditing or follow-up with suppliers.

### 💡 Summary of Join Use Cases
| Use Case                           | Tables Joined                                     | Purpose                                    |
| ---------------------------------- | ------------------------------------------------- | ------------------------------------------ |
| Product Profit Analysis            | `ordered_items` + `products`                      | Calculate unit profit and potential profit |
| Shipping Status Lookup             | `ordered_items` + `delivery_status` + `suppliers` | Combine order, status, and shipper info    |
| Investigate Old Undelivered Orders | Same as above with filter by date and status      | Track overdue or missing shipments         |




