-- MIT 8103: Portfolio 4
-- NoSQL and Advanced Data Models
-- Case Study: EliZeta Group

-- 1. Create a document-oriented table
CREATE TABLE IF NOT EXISTS public.product_documents (
    document_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    product_data JSONB NOT NULL
);

-- 2. Insert product documents
INSERT INTO public.product_documents (product_data)
VALUES
(
    '{
        "product_id": 101,
        "product_name": "North Fashion Classic Shirt",
        "category": "Clothing",
        "price_eur": 35.00,
        "stock_quantity": 20,
        "store": {
            "store_name": "North Fashion",
            "country": "Spain"
        }
    }'::jsonb
),
(
    '{
        "product_id": 102,
        "product_name": "Littlelearners Building Blocks",
        "category": "Toys",
        "price_eur": 24.50,
        "stock_quantity": 15,
        "store": {
            "store_name": "Littlelearners Toys",
            "country": "Spain"
        }
    }'::jsonb
);

-- 3. Retrieve all product documents
SELECT
    document_id,
    product_data
FROM public.product_documents;

-- 4. Extract and filter product information
SELECT
    product_data->>'product_name' AS product_name,
    product_data->>'category' AS category,
    (product_data->>'price_eur')::NUMERIC AS price_eur,
    product_data->'store'->>'store_name' AS store_name
FROM public.product_documents
WHERE product_data->>'category' = 'Clothing';
