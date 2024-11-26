# Database Schema for AirBnB Clone

## Overview
This repository contains the SQL script to define the schema for the AirBnB database. The database is designed to handle core functionalities like user management, property listings, bookings, payments, reviews, and messaging between users.

---

## Files
- **schema.sql**: SQL script to create tables, define constraints, and optimize performance with indexing.
- **README.md**: Documentation for the schema and its design principles.

---

## Schema Design

### Tables and Relationships
1. **User Table**
   - Manages user details (guests, hosts, and admins).
   - Unique constraint on `email` ensures no duplicate accounts.

2. **Property Table**
   - Contains property details listed by hosts.
   - Links to the `User` table via `host_id`.

3. **Booking Table**
   - Handles bookings by users for properties.
   - Links to the `User` and `Property` tables.

4. **Payment Table**
   - Manages payments for bookings.
   - Links to the `Booking` table.

5. **Review Table**
   - Stores reviews left by users for properties.
   - Links to the `User` and `Property` tables.

6. **Message Table**
   - Handles messages exchanged between users.
   - Links to the `User` table for sender and recipient information.

---

## Key Features
- **Constraints**
  - Ensures data integrity with primary and foreign keys.
  - Implements validation with ENUMs and CHECK constraints.

- **Indexing**
  - Optimized with indexes on commonly queried columns (`email`, `property_id`, `booking_id`).

---