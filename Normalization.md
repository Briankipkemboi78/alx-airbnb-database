# Normalization: Achieving Third Normal Form (3NF)

## **Objective**
The goal is to ensure that the Airbnb database schema adheres to the principles of Third Normal Form (3NF), which eliminates redundancy and ensures data integrity.

---

## **Normalization Process**

### **First Normal Form (1NF)**
1NF ensures that:
- The data is stored in a tabular format with rows and columns.
- Each column contains atomic values (no repeating groups or arrays).

**Review**:  
The schema provided already meets 1NF as all attributes contain atomic values and each table has a primary key.

---

### **Second Normal Form (2NF)**
2NF ensures that:
- The schema is in 1NF.
- All non-prime attributes are fully functionally dependent on the primary key.

**Review**:  
The schema already meets 2NF:
- Each table has a single-column or composite primary key.
- Non-key attributes are fully dependent on the primary key.

---

### **Third Normal Form (3NF)**
3NF ensures that:
- The schema is in 2NF.
- There are no transitive dependencies (non-prime attributes are only dependent on the primary key).

**Review and Adjustments**:  
Upon review, the schema meets 3NF requirements with minimal adjustments:

1. **`Payment` Table**:
   - `payment_method` is independent of `booking_id` and might require normalization if the methods have additional properties.  
   - **Action**: Create a `Payment_Method` table if extended metadata (e.g., fees, currency restrictions) is needed.

   Example:
   ```markdown
   Payment_Method
   --------------
   - method_id (Primary Key)
   - method_name (ENUM: credit_card, paypal, stripe)
   - fees
