
-- MIT 8103: Advanced Database Systems
-- Portfolio 1: Database Design and Modelling
-- Case study: EliZeta Group
-- All records below are fictional sample data.

INSERT INTO stores (store_id, store_name, country) VALUES
(1, 'North Fashion', 'Spain'),
(2, 'Littlelearners Toys', 'Spain'),
(3, 'Wjacket', 'Spain'),
(4, 'Marcus Store', 'Spain'),
(5, 'Beachbumstore', 'Spain'),
(6, 'Daisystore', 'Spain');

INSERT INTO products
    (product_id, store_id, product_name, category,
     price_eur, stock_quantity, is_active)
VALUES
(101, 1, 'Classic T-Shirt', 'Clothing', 19.99, 50, TRUE),
(102, 2, 'Building Blocks Set', 'Toys', 24.95, 30, TRUE),
(103, 3, 'Waterproof Jacket', 'Outerwear', 59.90, 20, TRUE),
(104, 4, 'Everyday Backpack', 'Accessories', 34.50, 25, TRUE),
(105, 5, 'Beach Towel', 'Beachwear', 14.99, 40, TRUE),
(106, 6, 'Ceramic Flower Vase', 'Home Decor', 22.00, 15, TRUE);

INSERT INTO customers
    (customer_id, full_name, email)
VALUES
(201, 'Lucia Martin', 'lucia.martin@example.com'),
(202, 'Daniel Garcia', 'daniel.garcia@example.com'),
(203, 'Sofia Lopez', 'sofia.lopez@example.com'),
(204, 'Mateo Ruiz', 'mateo.ruiz@example.com'),
(205, 'Elena Torres', 'elena.torres@example.com');

INSERT INTO orders
    (order_id, customer_id, store_id, order_date, status)
VALUES
(301, 201, 1, '2026-09-10 10:00:00+02', 'Paid'),
(302, 202, 3, '2026-09-11 11:30:00+02', 'Processing'),
(303, 203, 2, '2026-09-12 14:15:00+02', 'Pending'),
(304, 204, 5, '2026-09-13 16:45:00+02', 'Shipped');

INSERT INTO order_items
    (order_item_id, order_id, product_id, store_id,
     quantity, unit_price_eur)
VALUES
(401, 301, 101, 1, 2, 19.99),
(402, 302, 103, 3, 1, 59.90),
(403, 303, 102, 2, 2, 24.95),
(404, 304, 105, 5, 3, 14.99);
