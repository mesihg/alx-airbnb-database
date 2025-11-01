-- 1. AGGREGATION (GROUP BY): Find the total number of bookings made by each user.
SELECT
  u.user_id,
  u.first_name,
  u.last_name,
  COUNT(b.booking_id) AS total_bookings
FROM
  users AS u
LEFT JOIN
  bookings AS b ON u.user_id = b.user_id
GROUP BY
  u.user_id, u.first_name, u.last_name
ORDER BY
  total_bookings DESC;

-- 2. WINDOW FUNCTION (RANK): Rank properties based on the total number of bookings they have received.
SELECT
    p.property_id,
    p.name AS property_name,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM
    properties p
    LEFT JOIN
    bookings b ON p.property_id = b.property_id
GROUP BY
    p.property_id, p.property_name
ORDER BY
    booking_rank;

-- 3. WINDOW FUNCTION (ROW_NUMBER): Rank properties based on the total number of bookings they have received.
SELECT
    p.property_id,
    p.name AS property_name,
    COUNT(b.booking_id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM properties p
    LEFT JOIN booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name
ORDER BY booking_rank;
