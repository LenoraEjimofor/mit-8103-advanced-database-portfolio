
-- MIT 8103: Advanced Database Systems
-- Portfolio 3: Transactions and Concurrency
-- Experiment 1: Transaction rollback

BEGIN;

CREATE TABLE transaction_demo (
    demo_id INTEGER PRIMARY KEY,
    note TEXT NOT NULL
);

INSERT INTO transaction_demo (demo_id, note)
VALUES (1, 'Test record for rollback');

-- The row should be visible within the transaction.
SELECT * FROM transaction_demo;

-- Undo the table creation and inserted row.
ROLLBACK;

-- Run this verification separately after the transaction:
-- SELECT to_regclass('public.transaction_demo') AS test_table;
-- Expected result: NULL if the table was rolled back.
