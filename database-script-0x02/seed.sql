-- SQL script to populate the AirBnB database with sample data

-- Insert sample data into User table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
    ('111e4567-e89b-12d3-a456-426614174000', 'Alice', 'Smith', 'alice@example.com', 'hashedpassword123', '1234567890', 'guest', NOW()),
    ('222e4567-e89b-12d3-a456-426614174001', 'Bob', 'Brown', 'bob@example.com', 'hashedpassword456', '0987654321', 'host', NOW()),
    ('333e4567-e89b-12d3-a456-426614174002', 'Carol', 'Johnson', 'carol@example.com', 'hashedpassword789', '1122334455', 'admin', NOW());

-- Insert sample data into Property table
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night, created_at, updated_at)
VALUES
    ('444e4567-e89b-12d3-a456-426614174003', '222e4567-e89b-12d3-a456-426614174001', 'Cozy Apartment', 'A cozy 2-bedroom apartment in the city center.', 'New York, USA', 120.00, NOW(), NOW()),
    ('555e4567-e89b-12d3-a456-426614174004', '222e4567-e89b-12d3-a456-426614174001', 'Beachfront Villa', 'A luxurious villa with an ocean view.', 'Malibu, USA', 500.00, NOW(), NOW());

-- Insert sample data into Booking table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
    ('666e4567-e89b-12d3-a456-426614174005', '444e4567-e89b-12d3-a456-426614174003', '111e4567-e89b-12d3-a456-426614174000', '2024-12-01', '2024-12-05', 480.00, 'confirmed', NOW()),
    ('777e4567-e89b-12d3-a456-426614174006', '555e4567-e89b-12d3-a456-426614174004', '111e4567-e89b-12d3-a456-426614174000', '2024-12-10', '2024-12-15', 2500.00, 'pending', NOW());

-- Insert sample data into Payment table
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
    ('888e4567-e89b-12d3-a456-426614174007', '666e4567-e89b-12d3-a456-426614174005', 480.00, NOW(), 'credit_card');

-- Insert sample data into Review table
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
    ('999e4567-e89b-12d3-a456-426614174008', '444e4567-e89b-12d3-a456-426614174003', '111e4567-e89b-12d3-a456-426614174000', 5, 'Amazing stay! Highly recommend.', NOW());

-- Insert sample data into Message table
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
    ('aaa94567-e89b-12d3-a456-426614174009', '111e4567-e89b-12d3-a456-426614174000', '222e4567-e89b-12d3-a456-426614174001', 'Hi, is the apartment available on December 1st?', NOW()),
    ('bbb94567-e89b-12d3-a456-426614174010', '222e4567-e89b-12d3-a456-426614174001', '111e4567-e89b-12d3-a456-426614174000', 'Yes, it is available.', NOW());
