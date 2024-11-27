-- Initial Query: Retrieves booking, user, property, and payment details
  EXPLAIN ANALYZE
SELECT 
    booking.booking_id,
    booking.booking_date,
    booking.total_amount,
    user.user_id,
    user.first_name,
    user.last_name,
    user.email,
    property.property_id,
    property.property_name,
    property.location,
    payment.payment_id,
    payment.payment_method,
    payment.payment_date
FROM Booking AS booking
JOIN User AS user ON 
  booking.user_id = user.user_id
JOIN Property AS property ON 
  booking.property_id = property.property_id
JOIN Payment AS payment ON 
  booking.booking_id = payment.booking_id
WHERE 
    booking.booking_date >= '2024-01-01'
    AND booking.booking_date <= '2024-12-31'
    AND property.location = 'Nairobi';

-- Refactored Query: Optimized with indexing and reduced unnecessary columns
SELECT 
    booking.booking_id,
    booking.booking_date,
    booking.total_amount,
    user.first_name,
    user.email,
    property.property_name,
    payment.payment_method,
    payment.payment_date
FROM Booking AS booking
JOIN User AS user ON 
  booking.user_id = user.user_id
JOIN Property AS property ON 
  booking.property_id = property.property_id
LEFT JOIN Payment AS payment ON 
  booking.booking_id = payment.booking_id
WHERE
  booking.booking_date >= '2024-01-01' AND 
  booking.booking_date <= '2024-12-31' AND 
  property.location = 'Nairobi';

