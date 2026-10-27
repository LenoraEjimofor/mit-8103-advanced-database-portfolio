# Portfolio 1: Database Design and Modelling

**Course:** MIT 8103 — Advanced Database Systems  
**Case Study:** EliZeta Group Multi-Store E-Commerce Database  
**Student:** Lenora Ejimofor  
**Student ID:** 301905993

## 1.1 Case Study Description

EliZeta Group is the case study for this portfolio. The scenario covers six e-commerce stores: North Fashion, Littlelearners Toys, Wjacket, Marcus Store, Beachbumstore, and Daisystore.

The database design models store information, product inventories, customer records, customer orders, and the individual items contained in each order. PostgreSQL was used to implement the database through Supabase.

For this academic exercise, the design assumes that the six stores can be represented within one shared database. This is a modelling assumption and is not a claim about EliZeta Group's actual internal database architecture. The sample customer and transaction records are fictional.

## 1.2 Entity-Relationship Design

The database consists of five entities:

- **Stores:** records each store's identifier, name, and country.
- **Products:** records products, their store, category, price, stock quantity, and active status.
- **Customers:** records customer identifiers, names, email addresses, and creation timestamps.
- **Orders:** records the customer placing an order, the store associated with it, its date, and its status.
- **Order Items:** records the products included in an order, quantities, and the unit prices recorded for those items.

The relationships are implemented using primary and foreign keys. Each product belongs to a store. Each order references a customer and a store. Each order item references an order and a product, with composite foreign keys ensuring that the item, order, and product refer to the same store.

**ER diagram:** Insert the screenshot of the Supabase schema visualizer here before final submission.

## 1.3 Relational Schema

The implemented relational schema is:

- **Stores** (`store_id`, `store_name`, `country`)
- **Products** (`product_id`, `store_id`, `product_name`, `category`, `price_eur`, `stock_quantity`, `is_active`)
- **Customers** (`customer_id`, `full_name`, `email`, `created_at`)
- **Orders** (`order_id`, `customer_id`, `store_id`, `order_date`, `status`)
- **Order Items** (`order_item_id`, `order_id`, `product_id`, `store_id`, `quantity`, `unit_price_eur`)

The first attribute listed in each relation is its primary key. Foreign keys connect the relations as described in Section 1.2.

The SQL definition is provided in `schema.sql`, while `sample_data.sql` contains fictional records used to illustrate the model.

## 1.4 Keys and Constraints

Primary keys uniquely identify records in each table. Foreign keys preserve referential integrity by requiring related records to exist in the referenced tables.

Additional constraints include:

- Unique store names.
- Unique customer email addresses.
- Non-negative product prices and stock quantities.
- Positive quantities for order items.
- Non-negative recorded order-item prices.
- An order-status check limiting values to Pending, Paid, Processing, Shipped, Delivered, or Cancelled.
- Composite foreign keys that enforce store consistency between order items, orders, and products.

These constraints help prevent invalid values and inconsistent relationships.

## 1.5 Normalisation

The database separates stores, products, customers, orders, and order items into distinct relations to reduce unnecessary duplication and improve data integrity.

**First Normal Form (1NF):** The attributes are represented as individual fields, and each table has a primary key.

**Second Normal Form (2NF):** Each relation uses a single-column primary key. The non-key attributes are designed to describe the record identified by that key rather than a portion of a composite primary key.

**Third Normal Form (3NF):** The design separates information about stores, customers, products, and orders into their own relations rather than repeatedly storing their descriptive details in related records. A full formal assessment of 3NF depends on the business functional dependencies assumed for this case study.

The `unit_price_eur` field in Order Items records the price associated with the transaction. Keeping this recorded price separate from the product's current price allows the database to preserve the order price even if the product price changes later.

## 1.6 Implementation and Verification

The database was implemented in PostgreSQL through Supabase. The schema and sample data are documented in the accompanying SQL files.

A verification query was executed to compare the store identifier on each order item with the store identifiers on its associated order and product. The four returned sample records showed `CONSISTENT` for the relationship check.

The verification SQL is available in `verify_database.sql`. Screenshots of the ER diagram and query results should be included as supporting evidence in the completed portfolio.

## 1.7 Conclusion

The database design provides a structured model for managing stores, products, customers, orders, and order items. Primary keys, foreign keys, unique constraints, and check constraints support data integrity. The implementation and verification query demonstrate how the relational model can be represented and tested using PostgreSQL.
