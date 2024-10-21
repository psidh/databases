# SQL Cursors

## Overview

A **cursor** in SQL is a database object that allows you to retrieve and process rows returned by a query **one at a time**, rather than dealing with the entire result set at once. Cursors are particularly useful when you need to perform row-by-row operations that can't be easily achieved with standard SQL set-based operations.

## Why Use Cursors?

Cursors are used when:
- You need to **process each row individually** in a result set.
- **Complex logic** is required to handle each row.
- **Row-by-row updates or calculations** are necessary.
  
However, because cursors are generally slower than set-based SQL operations, they should be used **only when necessary**.

---

## Types of Cursors

### 1. **Implicit Cursors**
- Automatically created by SQL when performing DML operations like `INSERT`, `UPDATE`, or `DELETE`.
- No need to explicitly declare or control them.

### 2. **Explicit Cursors**
- Defined and controlled manually by the user.
- Used for **custom** row-by-row processing of a query result set.

---

## Cursor Lifecycle

### 1. **Declare the Cursor**
Define the query for the cursor.

```sql
DECLARE cursor_name CURSOR FOR
SELECT column1, column2 FROM table WHERE condition;
```

### 2. **Open the Cursor**
Execute the query and initialize the cursor.

```sql
OPEN cursor_name;
```

### 3. **Fetch Rows**
Retrieve one row at a time from the cursor.

```sql
FETCH cursor_name INTO variable1, variable2;
```

### 4. **Process Each Row**
Perform actions on each row fetched, such as calculations, logging, or updates.

### 5. **Close the Cursor**
Once done, release the resources used by the cursor.

```sql
CLOSE cursor_name;
```

---

## Example: Bank Transactions

### Scenario:
We have a `Transactions` table that stores customer transactions, and we want to process each transaction individually to calculate loyalty points based on the amount spent.

### Table Structure:
```sql
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    transaction_type VARCHAR(10),  -- 'deposit' or 'withdrawal'
    amount DECIMAL(10, 2),
    transaction_date DATE
);
```

### Cursor-Based Row-by-Row Processing:

```sql
DECLARE
    customer_id_var INT;
    transaction_type_var VARCHAR(10);
    amount_var DECIMAL(10, 2);

    -- Declare the cursor
    CURSOR transaction_cursor IS
    SELECT customer_id, transaction_type, amount FROM Transactions WHERE transaction_date >= '2023-01-01';

BEGIN
    -- Open the cursor
    OPEN transaction_cursor;

    -- Loop through the result set
    LOOP
        -- Fetch the next row
        FETCH transaction_cursor INTO customer_id_var, transaction_type_var, amount_var;

        -- Exit the loop when no more rows
        EXIT WHEN transaction_cursor%NOTFOUND;

        -- Process each row (Example: print the values)
        DBMS_OUTPUT.PUT_LINE('Customer: ' || customer_id_var || ' | Type: ' || transaction_type_var || ' | Amount: ' || amount_var);
    END LOOP;

    -- Close the cursor
    CLOSE transaction_cursor;
END;
```

### Explanation:
- **Declare**: The `transaction_cursor` selects all transactions from 2023.
- **Open**: Initializes the cursor to retrieve data.
- **Fetch**: Retrieves each row one by one into variables.
- **Loop**: The loop iterates through all rows, processing each.
- **Close**: The cursor is closed to release resources.

---

## When to Use Cursors

- **Row-by-Row Processing**: When you need to work with each row individually, such as in reporting or specific calculations.
- **Complex Operations**: For operations that require more than simple set-based logic, like detailed logging or row-based transformations.

---

## Limitations of Cursors

- **Performance**: Cursors are slower compared to set-based SQL operations because they process rows one at a time.
- **Resource Usage**: Cursors consume more memory and processing power, especially with large result sets. Always close them when done to free up resources.

---

## Best Practices for Using Cursors

1. **Use only when necessary**: If you can achieve the result with set-based SQL (e.g., `UPDATE`, `SELECT`), avoid using cursors.
2. **Keep transactions short**: Ensure that the operations in your cursor loop are quick to avoid long-running transactions.
3. **Always close the cursor**: Free up resources by closing the cursor after you’re done.
4. **Optimize fetch size** (if supported): Some databases allow you to fetch multiple rows at a time to minimize overhead.

---

## Conclusion

Cursors provide a powerful way to handle SQL result sets **row-by-row**, allowing for granular control over data processing. While they should be used sparingly, they are invaluable when more complex operations need to be applied to each individual row of a result set.

