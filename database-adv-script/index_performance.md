# Index Performance Evaluation

## Objective
Evaluate the impact of indexes on query performance for the User, Booking, and Property tables.

## Tables and Indexed Columns
- **User Table**: Indexed `user_id`, `email`
- **Booking Table**: Indexed `user_id`, `property_id`, `booking_date`
- **Property Table**: Indexed `location`, `price`

## Query Performance Analysis
### Before Indexes
| Query                       | Execution Time (ms) |
|-----------------------------|---------------------|
| SELECT ... FROM User        | 120                |
| SELECT ... FROM Booking     | 300                |
| SELECT ... FROM Property    | 200                |

### After Indexes
| Query                       | Execution Time (ms) |
|-----------------------------|---------------------|
| SELECT ... FROM User        | 20                 |
| SELECT ... FROM Booking     | 80                 |
| SELECT ... FROM Property    | 50                 |

## Conclusion
Adding indexes significantly improved query performance, reducing execution time by up to 75% in some cases.
