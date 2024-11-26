-- Non-Correlated Subquery: Properties with average rating > 4.0
SELECT 
    property.property_id, 
    property.name          AS property_name, 
    property.location, 
    property.pricepernight
FROM Property AS property
WHERE 
    (SELECT 
      AVG(review.rating)
     FROM Review AS review
     WHERE review.property_id = property.property_id) > 4.0;

-- Correlated Subquery: Users with more than 3 bookings
SELECT 
    user.user_id, 
    user.first_name, 
    user.last_name, 
    user.email
FROM 
    User AS user
WHERE 
    (SELECT COUNT(*)
     FROM Booking AS booking
     WHERE booking.user_id = user.user_id) > 3;