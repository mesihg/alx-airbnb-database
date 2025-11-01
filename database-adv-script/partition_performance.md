# Partitioning Large Tables

## Before Partitioning:
When running a query (like fetching bookings for a single quarter), the database had to perform a full scan or index scan across the entire massive Bookings table, reading data from all years.

## After Partitioning: 
Because the Bookings_Partitioned table is structured by the start_date column, when you run the testing query:
```
WHERE start_date BETWEEN '2025-01-15' AND '2025-03-01'
```
The database is smart enough to immediately recognize that only the bookings_p2025_q1 child table contains data for that date range. It instantly eliminates the need to even look at the other partitions (bookings_p2024, bookings_p2025_q2, bookings_p_future).
