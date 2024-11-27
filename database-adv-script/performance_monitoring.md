# Performance Monitoring and Refinement

## Objective
Continuously monitor and improve database performance by analyzing query execution plans and making schema adjustments.

## Queries Monitored
1. Fetch bookings by user (`user_id`).
2. Fetch bookings by property and date (`property_id`, `start_date`).
3. Aggregate bookings by region.

## Bottlenecks Identified
1. **Query 1**: Full table scan due to lack of index on `user_id`.
2. **Query 2**: Slow filtering due to no composite index on `property_id` and `start_date`.
3. **Query 3**: Expensive join between `Booking` and `Property`.

## Adjustments Made
1. Added index on `user_id` for `Booking`.
   ```sql
   CREATE INDEX idx_booking_user_id ON Booking (user_id);
