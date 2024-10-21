 -- Simple Example: Bank Transactions
-- Let's say we have a Bank database with a table called Transactions. The table keeps track of customer transactions like deposits and withdrawals.


CREATE TABLE Transactions (
  transaction_id INT PRIMARY KEY,
  customer_id INT,
  transaction_type VARCHAR(10),
  amount DECIMAL (10, 2),
  transaction_date DATE
);

-- let us process transactions
DECLARE transaction_cursor CURSOR FOR
SELECT customer_id, transaction_type, amount FROM Transactions
WHERE transaction_date >= '2024-10-06';

-- open the cursor

OPEN transaction_cursor

-- fetch rows from the cursor

FETCH transaction_cursor INTO customer_id_var, transaction_type_var, amount_var;

----------------------------------------------------------------------------------------------------------------------------------------------------------------


DECLARE

    -- iterables below just like i , j, and k  in loops in programming
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

        -- Exit the loop if there are no more rows
        EXIT WHEN transaction_cursor%NOTFOUND;

        -- Process each row (example: print data)
        DBMS_OUTPUT.PUT_LINE('Customer: ' || customer_id_var || ' | Type: ' || transaction_type_var || ' | Amount: ' || amount_var);
    END LOOP;

    -- Close the cursor
    CLOSE transaction_cursor;
END;


