# Airbnb Database ERD Requirements

## Overview
This document outlines the specifications for the database design of an Airbnb-like platform. It includes a detailed description of entities, their attributes, relationships, and the structure of the Entity-Relationship Diagram (ERD). The ERD visually represents the logical design of the database.

---

## **Entities and Attributes**

### **1. User**
Represents users of the platform (guests, hosts, or admins).

| Attribute         | Type        | Constraints                     |
|-------------------|-------------|----------------------------------|
| `user_id`         | UUID        | Primary Key, Indexed            |
| `first_name`      | VARCHAR     | NOT NULL                        |
| `last_name`       | VARCHAR     | NOT NULL                        |
| `email`           | VARCHAR     | UNIQUE, NOT NULL                |
| `password_hash`   | VARCHAR     | NOT NULL                        |
| `phone_number`    | VARCHAR     | NULL                            |
| `role`            | ENUM        | (guest, host, admin), NOT NULL  |
| `created_at`      | TIMESTAMP   | DEFAULT CURRENT_TIMESTAMP       |

---

### **2. Property**
Represents listings created by hosts.

| Attribute         | Type        | Constraints                           |
|-------------------|-------------|---------------------------------------|
| `property_id`     | UUID        | Primary Key, Indexed                  |
| `host_id`         | UUID        | Foreign Key, references `User(user_id)` |
| `name`            | VARCHAR     | NOT NULL                              |
| `description`     | TEXT        | NOT NULL                              |
| `location`        | VARCHAR     | NOT NULL                              |
| `pricepernight`   | DECIMAL     | NOT NULL                              |
| `created_at`      | TIMESTAMP   | DEFAULT CURRENT_TIMESTAMP             |
| `updated_at`      | TIMESTAMP   | ON UPDATE CURRENT_TIMESTAMP           |

---

### **3. Booking**
Represents reservations made by guests.

| Attribute         | Type        | Constraints                           |
|-------------------|-------------|---------------------------------------|
| `booking_id`      | UUID        | Primary Key, Indexed                  |
| `property_id`     | UUID        | Foreign Key, references `Property(property_id)` |
| `user_id`         | UUID        | Foreign Key, references `User(user_id)` |
| `start_date`      | DATE        | NOT NULL                              |
| `end_date`        | DATE        | NOT NULL                              |
| `total_price`     | DECIMAL     | NOT NULL                              |
| `status`          | ENUM        | (pending, confirmed, canceled), NOT NULL |
| `created_at`      | TIMESTAMP   | DEFAULT CURRENT_TIMESTAMP             |

---

### **4. Payment**
Tracks payments for bookings.

| Attribute         | Type        | Constraints                           |
|-------------------|-------------|---------------------------------------|
| `payment_id`      | UUID        | Primary Key, Indexed                  |
| `booking_id`      | UUID        | Foreign Key, references `Booking(booking_id)` |
| `amount`          | DECIMAL     | NOT NULL                              |
| `payment_date`    | TIMESTAMP   | DEFAULT CURRENT_TIMESTAMP             |
| `payment_method`  | ENUM        | (credit_card, paypal, stripe), NOT NULL |

---

### **5. Review**
Captures guest reviews for properties.

| Attribute         | Type        | Constraints                              |
|-------------------|-------------|------------------------------------------|
| `review_id`       | UUID        | Primary Key, Indexed                     |
| `property_id`     | UUID        | Foreign Key, references `Property(property_id)` |
| `user_id`         | UUID        | Foreign Key, references `User(user_id)`  |
| `rating`          | INTEGER     | CHECK: rating >= 1 AND rating <= 5, NOT NULL |
| `comment`         | TEXT        | NOT NULL                                 |
| `created_at`      | TIMESTAMP   | DEFAULT CURRENT_TIMESTAMP                |

---

### **6. Message**
Stores communication between users.

| Attribute         | Type        | Constraints                              |
|-------------------|-------------|------------------------------------------|
| `message_id`      | UUID        | Primary Key, Indexed                     |
| `sender_id`       | UUID        | Foreign Key, references `User(user_id)`  |
| `recipient_id`    | UUID        | Foreign Key, references `User(user_id)`  |
| `message_body`    | TEXT        | NOT NULL                                 |
| `sent_at`         | TIMESTAMP   | DEFAULT CURRENT_TIMESTAMP                |

---

## **Relationships**
1. **User ↔ Property**: A user (host) can create multiple properties.
2. **User ↔ Booking**: A user (guest) can make multiple bookings.
3. **Property ↔ Booking**: Each booking is associated with a single property.
4. **Booking ↔ Payment**: A payment is made for a specific booking.
5. **Property ↔ Review**: Properties can have multiple reviews by different users.
6. **User ↔ Message**: Users can send messages to one another.

---

## **Diagram Layout**
- **Entities** are represented as rectangles.
- **Attributes** are listed inside or below the entities.
- **Primary Keys (PK)** are underlined.
- **Foreign Keys (FK)** are connected by lines to their referenced entities.
- **Relationships** are represented as diamonds, labeled with the type of relationship.

---

## **ER Diagram**
The diagram visually represents the relationships and attributes detailed above. The file is included in this directory as `erd_diagram.png`.

---

## **Constraints**
- **Primary Keys**: Ensure unique identification for each record in the entities.
- **Foreign Keys**: Maintain referential integrity across entities.
- **Unique Constraints**: Prevent duplicate records (e.g., `email` in the `User` table).
- **CHECK Constraints**: Ensure data validity (e.g., `rating` between 1 and 5).

---

## **Indexing**
- Automatic indexing for primary keys.
- Additional indexes for:
  - `email` in the `User` table.
  - `property_id` in the `Property` and `Booking` tables.
  - `booking_id` in the `Booking` and `Payment` tables.

---

## **Brian Kipkemboi**

