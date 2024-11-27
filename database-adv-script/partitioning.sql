-- Drop the existing Booking table if needed
DROP TABLE IF EXISTS Booking CASCADE;

-- Create a partitioned table on start_date
CREATE TABLE Booking (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL
) PARTITION BY RANGE (start_date);

-- Create partitions for the last 3 years as an example
CREATE TABLE Booking_2022 PARTITION OF Booking
    FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');

CREATE TABLE Booking_2023 PARTITION OF Booking
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_2024 PARTITION OF Booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- Default partition to handle out-of-range dates
CREATE TABLE Booking_Default PARTITION OF Booking DEFAULT;

-- Insert sample data for testing
INSERT INTO Booking (user_id, property_id, start_date, end_date, total_amount)
VALUES
    (1, 101, '2023-06-01', '2023-06-07', 1200.00),
    (2, 102, '2024-02-01', '2024-02-05', 800.00),
    (3, 103, '2022-12-15', '2022-12-20', 500.00);






-- Testing performance
EXPLAIN ANALYZE
SELECT * FROM Booking
WHERE start_date BETWEEN '2023-06-01' AND '2023-06-30';

EXPLAIN ANALYZE
SELECT COUNT(*) FROM Booking
WHERE start_date >= '2023-01-01' AND start_date < '2024-01-01';

EXPLAIN ANALYZE
SELECT * FROM Booking WHERE booking_id = 2;

