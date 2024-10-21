CREATE TABLE Products(
  product_id NUMBER PRIMARY KEY,
  product_name VARCHAR2(100),
  category VARCHAR2(100),
  price NUMBER,
  stock_quantity NUMBER,
);

CREATE TABLE Customers(
  customer_id NUMBER  PRIMARY KEY,
  customer_name VARCHAR2(100),
  email VARCHAR2(100),
  city VARCHAR2(100),
  country VARCHAR2(100)
);

CREATE TABLE Order(
  order_id NUMBER PRIMARY KEY,
  customer_id NUMBER,
  product_id NUMBER,
  order_date DATE,
  quantity NUMBER,
  FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
  FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- views below
-- Creating a View for Product Inventory
CREATE VIEW Product_Inventory AS
SELECT product_name, category, price, stock_quantity
FROM Products
WHERE stock_quantity > 0;

-- querying the view is very simple

SELECT * FROM Product_Inventory;

-- Create a view for customer orders

CREATE VIEW Customer_Order_Summary AS
SELECT c.customer_name, p.product_name, o.order_date, o.quantity, (p.price * o.quantity) AS total
FROM Order o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Products p ON o.product_id = p.product_id

-- querying the view
SELECT * FROM Customer_Order_Summary WHERE customer_name = 'John Doe';

--  Scenario 3: Creating a View for High-Value Customers

CREATE VIEW High_Pay AS
SELECT c.customer_name, c.email , SUM(p.price * o.quantity) AS
TOTAL_SPENT

FROM Orders o
JOIN Customers c ON o.customer_id  = c.customer_id
JOIN Products p ON p.product_id = o.product_id
GROUP BY c.customer_name, c.email
HAVING SUM(p.price * o.quantity) > 1000;

-- querying the view
SELECT * FROM High_Value_Customers;

-- Scenario 4: Securing Data with Views
CREATE VIEW Public_Product_Info AS
SELECT product_name, category
FROM Products;


