
-- MIT 8103: Advanced Database Systems
-- Portfolio 3: Transactions and Concurrency
-- Experiment 2: Transaction commit

BEGIN;

CREATE TABLE public.transaction_commit_demo (
    demo_id INTEGER PRIMARY KEY,
    note TEXT NOT NULL
);

INSERT INTO public.transaction_commit_demo (demo_id, note)
VALUES (1, 'Committed test record');

COMMIT;

-- Verification query: run separately after committing.
SELECT *
FROM public.transaction_commit_demo;
