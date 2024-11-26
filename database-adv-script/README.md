# Advanced SQL Joins Queries

## Overview
This script contains SQL queries that demonstrate the use of INNER JOIN, LEFT JOIN, and FULL OUTER JOIN (or equivalent) to work with relational data in the AirBnB database.

---

## Files
- **joins_queries.sql**: Contains SQL queries to demonstrate different types of joins.
- **README.md**: Documentation explaining the tasks and queries.

---

## Tasks and Queries

### 1. INNER JOIN: Bookings and Users
- Retrieves all bookings along with the respective users who made those bookings.
- Ensures only bookings with valid user references are included in the results.

### 2. LEFT JOIN: Properties and Reviews
- Retrieves all properties and their associated reviews.
- Includes properties that have no reviews by ensuring the join preserves unmatched properties.

### 3. FULL OUTER JOIN: Users and Bookings
- Retrieves all users and all bookings.
- Ensures unmatched users and unmatched bookings are included in the results.
- Provides a workaround for databases like MySQL that do not natively support FULL OUTER JOIN.

---