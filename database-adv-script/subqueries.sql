-- 1. NON-CORRELATED SUBQUERY: Find all properties where the average rating is greater than 4.0.
SELECT
  p.property_id,
  p.name AS property_name,
  p.description,
  p.location
FROM
properties AS p
WHERE p.property_id IN (
    SELECT
      r.property_id
    FROM
      reviews AS r
    GROUP BY
       r.property_id
    HAVING
      AVG(r.rating) > 4.0
);

-- 2. CORRELATED SUBQUERY: Find users who have made more than 3 bookings.
SELECT
  u.user_id,
  u.first_name,
  u.last_name
FROM
  users AS u
WHERE EXISTS (
SELECT
  1
FROM
  bookings AS b
WHERE
  b.user_id = u.user_id
GROUP BY 
  b.user_id
HAVING 
  COUNT(b.booking_id) > 3
);
