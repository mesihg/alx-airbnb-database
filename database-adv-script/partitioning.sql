-- 1. Create the Master Partitioned Table
CREATE TABLE bookings_partitioned (
  booking_id SERIAL NOT NULL,
  user_id INT NOT NULL,
  property_id INT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  amount DECIMAL(10, 2),
  CONSTRAINT pk_bookings PRIMARY KEY (booking_id, start_date)
) PARTITION BY RANGE (start_date);

-- 2. Create partition for 2024 bookings
CREATE TABLE bookings_p2024 PARTITION OF bookings_partitioned
FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- Partition for 2025 Quarter 1 bookings
CREATE TABLE bookings_p2025_q1 PARTITION OF bookings_partitioned
FOR VALUES FROM ('2025-01-01') TO ('2025-04-01');

-- Partition for 2025 Quarter 2 bookings
CREATE TABLE bookings_p2025_q2 PARTITION OF bookings_partitioned
FOR VALUES FROM ('2025-04-01') TO ('2025-07-01');
