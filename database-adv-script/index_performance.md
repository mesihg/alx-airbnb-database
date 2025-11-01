# ndexes for Optimization
## Before Indexing:
Complex queries like the Correlated Subquery suffered significantly because the database had to perform a Full Table Scan on the entire Bookings table for every single user it processed.
This resulted in extremely slow execution times, especially as the number of users and bookings grew.

## After Indexing:
The database utilizes the newly created indexes on foreign key columns, such as idx_booking_user_id and idx_booking_property_id.
For joins, this optimization allows the system to instantly locate matching records instead of sequentially scanning the entire table, leading to much faster Index Scan operations.
