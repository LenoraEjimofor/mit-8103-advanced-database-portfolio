# Portfolio 4: NoSQL and Advanced Data Models

## Case Study
EliZeta Group is a simulated multi-store e-commerce organisation operating six retail stores in Spain. This portfolio uses the same case study as the previous database activities.

## Objective
The objective is to demonstrate a document-oriented data model using JSON documents and explore how flexible document structures can support e-commerce product information.

## Implementation
The exercise uses PostgreSQL's JSONB data type in Supabase to store product documents. Each document contains product information, including product ID, product name, category, price, stock quantity, and nested store details.

## Practical Evidence
The implementation includes:
- Creation of a document storage table.
- Insertion of two JSON product documents.
- Extraction of product information using JSON operators.
- Filtering documents by product category.
- Retrieval of nested store information.

## Files
- `nosql_documents.sql` – SQL commands for creating and querying the JSONB documents.
- `nosql_analysis.md` – Explanation of the model, its suitability, advantages, and limitations.
- `Ejimofor_Lenora_Portfolio4_JSON_Query.png` – Screenshot of the JSON query and result.

## Technology
- Supabase
- PostgreSQL
- JSONB

## Note
This is a document-oriented modelling exercise implemented with PostgreSQL JSONB. It demonstrates NoSQL-style document storage and querying; it is not a separate MongoDB deployment.
