----Before Indexes
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE user_id = 12345;

-- Creating indexes for the User table
CREATE INDEX idx_user_id ON User(user_id);
CREATE INDEX idx_user_email ON User(email);

-- Creating indexes for the Booking table
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_date ON Booking(booking_date);

-- Creating indexes for the Property table
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_price ON Property(price);


----After Indexes
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE user_id = 12345;
