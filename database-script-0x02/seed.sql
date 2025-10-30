-- 1. User Data
-- Create three users: one host, one guest, and one admin

INSERT INTO "users" (user_id, first_name, last_name, email, password_hash, phone_number, role) VALUES
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Elara', 'Vance', 'elara.vance@example.com', 'hashed_pass_elara', '555-123-4567', 'host'),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'Jax', 'Cinder', 'jax.cinder@example.com', 'hashed_pass_jax', '555-987-6543', 'guest'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'Admin', 'User', 'admin@example.com', 'hashed_pass_admin', NULL, 'admin');


-- 2. Property Data
-- Create two properties, both owned by the Host (Elara Vance)
-- host_id: a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11

INSERT INTO "properties" (property_id, host_id, name, description, location, pricepernight) VALUES
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Sunset Ocean View Villa', 'A stunning 3-bedroom villa right on the coast.', 'Malibu, CA', 750.00),
('e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a55', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Downtown Loft Studio', 'Modern studio apartment in the heart of the city.', 'New York, NY', 185.50);


-- 3. Booking Data
-- Create two bookings by the Guest (Jax Cinder)
-- user_id: b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22

-- Booking 1: Confirmed reservation for the Villa (d0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44)
INSERT INTO "bookings" (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a66', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', '2025-11-01', '2025-11-05', 3000.00, 'confirmed');

-- Booking 2: Pending reservation for the Loft (e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a55)
INSERT INTO "bookings" (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES
('11eebc99-9c0b-4ef8-bb6d-6bb9bd380a77', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a55', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', '2026-01-10', '2026-01-12', 371.00, 'pending');

-- Booking 3: Canceled reservation for the Loft (e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a55)
INSERT INTO "bookings" (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES
('12eebc99-9c0b-4ef8-bb6d-6bb9bd380a88', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a55', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', '2025-05-15', '2025-05-18', 556.50, 'canceled');


-- 4. Payment Data
-- Create two payments for the Confirmed Booking (Booking 1)
-- booking_id: f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a66

INSERT INTO "payments" (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('22eebc99-9c0b-4ef8-bb6d-6bb9bd380a99', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a66', 1500.00, '2025-10-01', 'credit_card'),
('33eebc99-9c0b-4ef8-bb6d-6bb9bd380b00', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a66', 1500.00, '2025-10-15', 'stripe');


-- 5. Review Data
-- Create two reviews by the Guest (Jax Cinder)
-- user_id: b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22

-- Review 1: For the Villa (d0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44)
INSERT INTO "reviews" (review_id, property_id, user_id, rating, comment) VALUES
('44eebc99-9c0b-4ef8-bb6d-6bb9bd380b11', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 5, 'Absolutely spectacular views! The host was incredibly responsive and the property was pristine.');

-- Review 2: For the Loft (e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a55)
INSERT INTO "reviews" (review_id, property_id, user_id, rating, comment) VALUES
('55eebc99-9c0b-4ef8-bb6d-6bb9bd380b22', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a55', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 4, 'Great location and stylish design. The only minor drawback was the street noise at night.');


-- 6. Message Data
-- Create one message exchange between Guest (Jax) and Host (Elara)

-- Jax (Guest) asks Elara (Host) a question
INSERT INTO "messages" (message_id, sender_id, recipient_id, message_body) VALUES
('66eebc99-9c0b-4ef8-bb6d-6bb9bd380b33', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Hello Elara, is there a grocery store nearby the villa?');

-- Elara (Host) replies to Jax (Guest)
INSERT INTO "messages" (message_id, sender_id, recipient_id, message_body) VALUES
('77eebc99-9c0b-4ef8-bb6d-6bb9bd380b44', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'Hi Jax! Yes, there is a large market about a five-minute drive away.');
