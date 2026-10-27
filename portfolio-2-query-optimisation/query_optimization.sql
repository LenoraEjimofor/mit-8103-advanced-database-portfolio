
-- MIT 8103: Advanced Database Systems
-- Portfolio 2: Query Processing and Optimisation
-- EliZeta Group case study

-- Experiment 1: Baseline query execution plan.
EXPLAIN ANALYZE
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
ORDER BY o.order_date;

-- Experiment 2: Create an index on the order date.
CREATE INDEX IF NOT EXISTS idx_orders_order_date
ON orders (order_date);

-- Experiment 3: Inspect the execution plan again.
EXPLAIN ANALYZE
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
ORDER BY o.order_date;
