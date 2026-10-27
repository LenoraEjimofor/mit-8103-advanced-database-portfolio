
-- MIT 8103: Advanced Database Systems
-- Portfolio 1: Database Design and Modelling
-- Verification queries for the EliZeta Group database.
-- Run these in the Supabase SQL Editor to obtain actual results.

-- 1. Check that all six stores are present.
SELECT store_id, store_name, country
FROM stores
ORDER BY store_id;

-- 2. View products alongside their store names.
SELECT
    p.product_id,
    p.product_name,
    p.category,
    p.price_eur,
    p.stock_quantity,
    s.store_name
FROM products AS p
JOIN stores AS s
    ON p.store_id = s.store_id
ORDER BY s.store_name;

-- 3. View orders alongside customer and store details.
SELECT
    o.order_id,
    c.full_name AS customer_name,
    s.store_name,
    o.order_date,
    o.status
FROM orders AS o
JOIN customers AS c
    ON o.customer_id = c.customer_id
JOIN stores AS s
    ON o.store_id = s.store_id
ORDER BY o.order_id;

-- 4. Verify that each order item belongs to the same store
-- as both its order and its product.
SELECT
    oi.order_item_id,
    oi.order_id,
    oi.product_id,
    oi.store_id AS item_store_id,
    o.store_id AS order_store_id,
    p.store_id AS product_store_id,
    CASE
        WHEN oi.store_id = o.store_id
         AND oi.store_id = p.store_id
        THEN 'CONSISTENT'
        ELSE 'INCONSISTENT'
    END AS relationship_check
FROM order_items AS oi
JOIN orders AS o
    ON oi.order_id = o.order_id
   AND oi.store_id = o.store_id
JOIN products AS p
    ON oi.product_id = p.product_id
   AND oi.store_id = p.store_id
ORDER BY oi.order_item_id;

-- 5. Calculate sample order values using recorded item prices.
SELECT
    o.order_id,
    s.store_name,
    SUM(oi.quantity * oi.unit_price_eur) AS order_value_eur
FROM orders AS o
JOIN stores AS s
    ON o.store_id = s.store_id
JOIN order_items AS oi
    ON o.order_id = oi.order_id
   AND o.store_id = oi.store_id
GROUP BY o.order_id, s.store_name
ORDER BY o.order_id;
