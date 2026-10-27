# Portfolio 2: Query Processing and Optimisation

## 1. Objective

This experiment examined how PostgreSQL processes a query that joins the `orders`, `customers`, and `stores` tables and sorts the results by order date. The purpose was to inspect the execution plan, measure execution time, and investigate the effect of adding an index.

## 2. Baseline Execution Plan

The original query used sequential scans on the `orders`, `customers`, and `stores` tables. PostgreSQL combined the records using hash joins and sorted the output by `order_date` using quicksort.

The measured execution time was **0.315 ms**, with four rows returned. The estimated total plan cost was 87.65, and the estimated row count was 770, while the actual result contained four rows.

This difference between estimated and actual row counts shows that the planner's estimates did not match the small dataset used in the experiment.

## 3. Index Experiment

An index was created on `orders.order_date` using:

```sql
CREATE INDEX IF NOT EXISTS idx_orders_order_date
ON orders (order_date);
```

The query was then executed again using `EXPLAIN ANALYZE`.

The second plan used nested-loop joins instead of hash joins. It used the existing primary-key indexes to retrieve matching customer and store records. However, PostgreSQL continued to perform a sequential scan on `orders` and a separate sort on `order_date`; the new date index was not used in the displayed plan.

The measured execution time in this run was **0.911 ms**, with four rows returned.

## 4. Performance Comparison

| Measurement | Baseline | Second run |
|---|---:|---:|
| Execution time | 0.315 ms | 0.911 ms |
| Actual rows | 4 | 4 |
| Join strategy | Hash Join | Nested Loop |
| Scan of `orders` | Sequential | Sequential |
| Sort required | Yes | Yes |

The second measured execution time was higher than the baseline. However, the experiment does not establish that the index caused the increase. Execution times at this scale can be affected by caching, planning choices, and measurement overhead. The two runs also used different join strategies, so the results cannot be attributed to the index alone.

## 5. Discussion and Limitations

The experiment demonstrates that creating an index does not guarantee improved query performance. PostgreSQL's query planner chooses an execution strategy based on its estimates and the available access paths.

The sample database contains only a few records. Sequential scans are often reasonable for small tables, and a larger dataset would be needed to evaluate the potential benefit of the date index more reliably. Repeated measurements under comparable conditions would also help distinguish a genuine performance difference from normal timing variation.

## 6. Conclusion

The query successfully retrieved four orders and joined them to their associated customers and stores. The baseline execution plan used hash joins, while the second plan used nested-loop joins and existing primary-key indexes. The new date index was not selected by the planner in the observed plan.

The experiment therefore provides evidence of how PostgreSQL's execution strategy can change, but it does not demonstrate a performance improvement from the new index.
