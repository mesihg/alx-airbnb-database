# Query Optimization

## Initial Query (Verbose and Potentially Inefficient)
For the initial query, we will use explicit INNER JOIN statements for all tables and select every column (SELECT *) to mimic a developer writing a large, unoptimized report query.

## Refactored Query (Optimized)
The refactored query focused on three key optimizations:
* Select only necessary columns: Avoid SELECT *.
* Ensure Joins Use Indexes: (We already created indexes on the join keys like user_id, property_id, booking_id).
* Use specific filtering: Add a WHERE clause to limit the result set (e.g., only confirmed bookings).
