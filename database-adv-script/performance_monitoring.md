# Performance Monitoring

Optimizing query performance is a continuous process. For our high-traffic and complex queries (such as filtered joins and correlated subqueries), consistent monitoring ensures the system remains efficient as data volume grows.

## 1. Bottleneck Identification

Method: **EXPLAIN ANALYZE** was used to assess the refactored join query filtering by start_date and status.
Finding: Despite existing indexes, performance analysis revealed high execution costs caused by full table scans or inefficient use of multiple indexes.

## 2. Schema Enhancement

Issue: Queries frequently filter on both start_date and user_id.
Action Taken: Implemented a composite index to optimize access paths:

```
CREATE INDEX idx_bookings_date_user ON Bookings (start_date, user_id);
```
