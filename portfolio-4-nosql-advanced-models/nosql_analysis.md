# Portfolio 4: NoSQL and Advanced Data Models — Analysis

## 1. Introduction

This activity explores a document-oriented data model using the EliZeta Group e-commerce case study. The objective is to demonstrate how product information can be stored and retrieved using a flexible document structure.

The implementation uses PostgreSQL's JSONB data type through Supabase. JSONB supports structured JSON documents and provides operators for accessing and filtering document fields.

## 2. Data Model and Implementation

A table named `product_documents` was created with two columns:

- `document_id`: a generated unique identifier for each document.
- `product_data`: a JSONB column containing the product document.

Two sample product documents were inserted. Each document contains product identification, name, category, price, stock quantity and nested store information.

The nested `store` object contains the store name and country. This demonstrates how related information can be represented within a single document rather than being retrieved through a relational join.

## 3. Querying the Documents

The implementation used PostgreSQL JSON operators:

- `->>` extracts a JSON field as text.
- `->` retrieves a JSON object or value.
- A filter on the `category` field retrieves only documents matching a specified category.

The test query successfully retrieved the North Fashion Classic Shirt, its Clothing category, price of €35.00 and associated store name.

## 4. Suitability for EliZeta Group

A document-oriented model can be useful for product catalogue information because different product categories may require different attributes. A flexible document structure can accommodate additional product details without requiring a fixed relational column for every possible attribute.

For example, clothing products could contain size and colour attributes, while toys could contain age-range and material attributes.

The model also allows store details to be embedded within each product document, making the information available in a single document retrieval.

## 5. Advantages and Limitations

### Advantages
- Flexible structure for products with different attributes.
- Supports nested data.
- Allows document fields to be queried using JSON operators.
- Can reduce the need for joins when retrieving embedded information.

### Limitations
- Repeated store information across documents can create data duplication.
- Updating embedded information across many documents may require multiple updates.
- Flexible document structures require validation to maintain consistent data quality.
- Complex relationships and transactions may be easier to manage using a relational model.

## 6. Comparison with the Relational Model

The earlier portfolio activities used relational tables with primary keys, foreign keys and constraints to maintain relationships between stores, products, customers and orders.

The JSONB implementation demonstrates a different approach: product information and nested store details are stored together in individual documents.

The two approaches serve different purposes. A relational model is suitable for maintaining structured relationships and transactional consistency, while a document model offers flexibility for product catalogue information.

## 7. Conclusion

The exercise successfully demonstrated document storage and querying using PostgreSQL JSONB. Two product documents were inserted, and a query extracted selected product fields and nested store information.

Although this implementation uses PostgreSQL rather than a separate NoSQL database platform, it demonstrates document-oriented data modelling and provides a practical comparison with the relational design developed in Portfolio 1.
