USE Northwind;

-- What is the product name(s) of the most expensive products? HINT: Find the max price in a subquery and then use that value to find products
-- whose price equals that value.
SELECT ProductName
FROM products
WHERE UnitPrice = (
SELECT MAX(UnitPrice)
FROM products ); 
-- Cte de Blaye

-- What is the product name(s) and categories of the least expensive products? 
SELECT p.ProductName,
	   c.CategoryName
FROM products as p
JOIN categories as c ON p.CategoryID = c.CategoryID
WHERE p.UnitPrice = (
SELECT MIN(UnitPrice)
FROM products );
-- Geitost Dairy Products

-- What is the order id, shipping name and shipping address of all orders shipped via "Federal Shipping"?
SELECT OrderID, ShipName, ShipAddress 
FROM orders
WHERE ShipVia = (
	SELECT ShipperID
    FROM shippers
    WHERE CompanyName = 'Federal Shipping'
);

-- What are the order ids of the orders that included "Sasquatch Ale"? 
-- HINT: Find the product id of "Sasquatch Ale" in a subquery and then use that value
-- to find the matching orders from the `order details` table.
SELECT OrderID 
FROM `order details`
WHERE ProductID = (
	SELECT ProductID
    FROM products
    WHERE ProductName = 'Sasquatch Ale'
);

-- What is the name of the employee that sold order 10266? 
SELECT o.OrderID,
	   e.FirstName
FROM orders AS o 
JOIN employees AS e ON o.EmployeeID = e.EmployeeID
WHERE o.OrderID = '10266';
-- Janet Leverling ID 3

-- What is the name of the customer that bought order 10266?
SELECT o.OrderID ,ContactName AS CustomerName
FROM customers AS c 
JOIN orders AS o ON o.CustomerID = c.CustomerID
WHERE o.OrderID = '10266'
-- Pirkko Koskitalo


