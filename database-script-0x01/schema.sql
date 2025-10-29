CREATE TYPE "role" AS ENUM (
  'guest',
  'host',
  'admin'
);

CREATE TYPE "booking_status" AS ENUM (
  'pending',
  'confirmed',
  'canceled'
);

CREATE TYPE "payment_method" AS ENUM (
  'credit_card',
  'paypal',
  'stripe'
);

CREATE TABLE IF NOT EXISTS "users" (
  "user_id" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  "first_name" VARCHAR NOT NULL,
  "last_name" VARCHAR NOT NULL,
  "email" VARCHAR UNIQUE NOT NULL,
  "password_hash" VARCHAR NOT NULL,
  "phone_number" VARCHAR NULL,
  "role" user_role NOT NULL,
  "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE IF NOT EXISTS "properties" (
  "property_id" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  "host_id" UUID NOT NULL REFERENCES "user"("user_id"),
  "name" VARCHAR NOT NULL,
  "description" TEXT NOT NULL,
  "location" VARCHAR NOT NULL,
  "pricepernight" DECIMAL NOT NULL,
  "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS "bookings" (
  "booking_id" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  "property_id" UUID NOT NULL REFERENCES "Property"("property_id"),
  "user_id" UUID NOT NULL REFERENCES "User"("user_id"),
  "start_date" DATE NOT NULL,
  "end_date" DATE NOT NULL,
  "total_price" DECIMAL NOT NULL,
  "status" booking_status NOT NULL,
  "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE IF NOT EXISTS "payments" (
  "payment_id" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  "booking_id" UUID NOT NULL REFERENCES "Booking"("booking_id"),
  "amount" DECIMAL NOT NULL,
  "payment_date" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  "payment_method" payment_method NOT NULL
);


CREATE TABLE IF NOT EXISTS "reviews" (
  "review_id" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  "property_id" UUID NOT NULL REFERENCES "Property"("property_id"),
  "user_id" UUID NOT NULL REFERENCES "User"("user_id"),
  "rating" INTEGER NOT NULL CHECK ("rating" >= 1 AND "rating" <= 5),
  "comment" TEXT NOT NULL,
  "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE IF NOT EXISTS "messages" (
  "message_id" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  "sender_id" UUID NOT NULL REFERENCES "User"("user_id"),
  "recipient_id" UUID NOT NULL REFERENCES "User"("user_id"),
  "message_body" TEXT NOT NULL,
  "sent_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS "idx_user_email" ON "users" ("email");
CREATE INDEX IF NOT EXISTS "idx_booking_property" ON "bookings" ("property_id");
CREATE INDEX IF NOT EXISTS "idx_payment_booking" ON "payments" ("booking_id");
