# Concurrency Experiment and Isolation Level

## Objective
The experiment examined how two separate database sessions interact when accessing the same product record in an inventory table.

## Test Setup
A table named `concurrency_demo` was created with one product record:

| Product ID | Product Name | Initial Stock |
|---|---|---:|
| 1 | Test Product | 10 |

Two separate SQL sessions were used. Their PostgreSQL backend process IDs were:

- Session A: 462094
- Session B: 462097

## Transaction and Concurrency Test
In Session A, a transaction was started and the product row was selected using `SELECT ... FOR UPDATE`.

In Session B, a separate transaction attempted to decrease the stock quantity by one. The query returned a stock quantity of 9.

However, Session B did not visibly wait for Session A's row lock. After the transactions were closed, a subsequent verification query in both sessions returned the stock quantity as 10.

Therefore, the experiment confirmed the use of two separate sessions and demonstrated transaction activity, but it did not conclusively demonstrate blocking caused by a row-level lock. The observed results were retained rather than presented as a successful locking demonstration.

## Isolation Level
The database reported the transaction isolation level as `READ COMMITTED`.

Under this isolation level, a query sees data committed before that query begins. The isolation-level query and its output were captured as evidence.

## Conclusion
The experiment provided practical exposure to transaction boundaries, separate database sessions, row-level locking syntax, and transaction isolation. The locking behaviour was not conclusively verified, so further controlled testing would be required to demonstrate session blocking reliably.
