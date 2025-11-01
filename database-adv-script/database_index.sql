CREATE INDEX idx_user_first_name ON users (first_name);
CREATE INDEX idx_booking_user_id ON bookings (user_id);
CREATE INDEX idx_booking_property_id ON bookings (property_id);
CREATE INDEX idx_booking_start_date ON bookings (start_date);
CREATE INDEX idx_property_city ON properties (city);
CREATE INDEX idx_review_property_id ON reviews (property_id);
CREATE INDEX idx_review_rating ON reviews (rating);


-- Retrieve all bookings and the respective users who made those bookings.
EXPLAIN ANALYZE
SELECT
  b.booking_id,
  b.start_date,
  b.end_date,
  b.total_price,
  b.status,
  b.user_id,
  u.first_name,
  u.last_name,
  u.email
FROM
  bookings AS b
INNER JOIN
  users AS u ON b.user_id = u.user_id;
