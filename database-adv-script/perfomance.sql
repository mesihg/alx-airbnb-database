-- INITIAL QUERY (Verbose and Potentially Inefficient)
-- Goal: Retrieve ALL details for ALL bookings, users, properties, and payments.
SELECT
  *
FROM
  bookings AS b
INNER JOIN
  users AS u ON b.user_id = u.user_id
INNER JOIN
  properties AS p ON b.property_id = p.property_id
INNER JOIN
  payments AS pay ON b.booking_id = pay.booking_id
ORDER BY
  b.start_date DESC;

-- REFACTORED QUERY (Optimized for Speed and Specificity)
EXPLAIN
SELECT
  b.booking_id,
  b.start_date,
  u.first_name,
  p.name AS property_name,
  pay.amount,
  b.status
FROM
  bookings AS b
INNER JOIN
  users AS u ON b.user_id = u.user_id
INNER JOIN
  properties AS p ON b.property_id = p.property_id
INNER JOIN
  payments AS pay ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed' 
ORDER BY
  b.start_date DESC;
