-- Total Bookings per User using COUNT and GROUP BY
SELECT 
    booking.user_id, 
    user.first_name, 
    user.last_name, 
    COUNT(booking.booking_id) AS total_bookings
FROM Booking AS booking
JOIN User AS user ON 
  booking.user_id = user.user_id
GROUP BY 
    booking.user_id, 
    user.first_name, 
    user.last_name
ORDER BY 
    total_bookings DESC;


-- Rank Properties by Total Bookings using ROW_NUMBER and RANK
SELECT 
    property.property_id, 
    property.name                                         AS property_name, 
    property.location, 
    COUNT(booking.booking_id)                             AS total_bookings,
    RANK() OVER (ORDER BY COUNT(booking.booking_id) DESC) AS rank_by_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS row_number_by_bookings
FROM Property AS property
LEFT JOIN Booking AS booking ON 
  property.property_id = booking.property_id
GROUP BY 
  property.property_id, p.name, p.location
ORDER BY 
    total_bookings DESC;
