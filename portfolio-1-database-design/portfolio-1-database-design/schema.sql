
-- MIT 8103: Advanced Database Systems
-- Portfolio 1: Database Design and Modelling
-- Case study: EliZeta Group
-- Sample academic database schema using PostgreSQL.
-- Note: This is a reproducible schema script. Review before executing
-- against an existing database.

CREATE TABLE stores (
    store_id INTEGER PRIMARY KEY,
    store_name VARCHAR(150) NOT NULL UNIQUE,
    country VARCHAR(100) NOT NULL
);

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    store_id INTEGER NOT NULL,
    product_name VARCHAR(150) NOT NULL,
    category VARCHAR(100) NOT NULL,
    price_eur NUMERIC(10, 2) NOT NULL
        CHECK (price_eur >= 0),
    stock_quantity INTEGER NOT NULL
        CHECK (stock_quantity >= 0),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    CONSTRAINT fk_products_store
        FOREIGN KEY (store_id)
        REFERENCES stores (store_id),

    CONSTRAINT products_product_store_unique
        UNIQUE (product_id, store_id)
);

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    store_id INTEGER NOT NULL,
    order_date TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(30) NOT NULL
        CHECK (status IN (
            'Pending',
            'Paid',
            'Processing',
            'Shipped',
            'Delivered',
            'Cancelled'
        )),

    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id),

    CONSTRAINT fk_orders_store
        FOREIGN KEY (store_id)
        REFERENCES stores (store_id),

    CONSTRAINT orders_order_id_store_id_key
        UNIQUE (order_id, store_id)
);

CREATE TABLE order_items (
    order_item_id INTEGER PRIMARY KEY,
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    store_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL
        CHECK (quantity > 0),
    unit_price_eur NUMERIC(10, 2) NOT NULL
        CHECK (unit_price_eur >= 0),

    CONSTRAINT fk_order_items_order_store
        FOREIGN KEY (order_id, store_id)
        REFERENCES orders (order_id, store_id),

    CONSTRAINT fk_order_items_product_store
        FOREIGN KEY (product_id, store_id)
        REFERENCES products (product_id, store_id)
);
