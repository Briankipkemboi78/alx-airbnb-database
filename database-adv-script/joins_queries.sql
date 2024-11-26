-- 1. Retrieve all bookings and the respective users who made those bookings using an INNER JOIN
SELECT 
    booking.booking_id,
    user.user_id,
    user.first_name,
    user.last_name,
    booking.property_id,
    booking.start_date,
    booking.end_date,
    booking.total_price,
    booking.status
FROM Booking AS booking
INNER JOIN User AS user ON 
  booking.user_id = user.user_id;

-- 2. Retrieve all properties and their reviews, including properties that have no reviews, using a LEFT JOIN
SELECT 
    property.property_id,
    property.name AS property_name,
    review.review_id,
    review.rating,
    review.comment,
    review.created_at AS review_date
FROM Property AS property
LEFT JOIN Review AS review ON 
  property.property_id = review.property_id;

-- 3. Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user, using a FULL OUTER JOIN
-- Note: FULL OUTER JOIN is not supported in some databases like MySQL. For MySQL, UNION can be used as a workaround.
SELECT 
    user.user_id,
    user.first_name,
    user.last_name,
    booking.booking_id,
    booking.property_id,
    booking.start_date,
    booking.end_date,
    booking.total_price,
    booking.status
FROM User AS user
FULL OUTER JOIN Booking AS booking ON 
  user.user_id = booking.user_id
-- If using MySQL:
-- UNION ALL
-- SELECT 
--     user.user_id,
--     user.first_name,
--     user.last_name,
--     booking.booking_id,
--     booking.property_id,
--     booking.start_date,
--     booking.end_date,
--     booking.total_price,
--     booking.status
-- FROM Booking AS booking
-- LEFT JOIN User AS user ON
  -- booking.user_id = user.user_id;
;
