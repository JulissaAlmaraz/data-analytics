USE Northwind;

-- Write a query to find the price of the cheapest item that Northwind sells. Then write a second query to find the name of the product that has that price.
SELECT MIN(UnitPrice)
FROM products;
-- 2.50
SELECT ProductName
FROM products
WHERE UnitPrice = (
	SELECT MIN(UnitPrice)
	FROM products
);
-- Geitost

-- Write a query to find the average price of all items that Northwind sells.
SELECT AVG(UnitPrice)
FROM products;
-- 28.86636364
-- (Bonus: Once you have written a working query, try asking Claude or ChatGPT for help using the ROUND function to round the average price to the nearest cent.)
SELECT ROUND(AVG(UnitPrice),2)
FROM products;
-- 28.87

-- Write a query to find the price of the most expensive item that Northwind sells. Then write a second query to find the name of the product with that price, plus the name of
-- the supplier for that product.
SELECT MAX(UnitPrice)
FROM products;
-- 263.50
SELECT p.ProductName,
	   s.CompanyName AS SupplierName 
FROM products as p
JOIN suppliers as s ON p.SupplierID = s.SupplierID
WHERE UnitPrice = (
	SELECT MAX(UnitPrice)
	FROM products
);
-- Cte de Blaye Aux joyeux ecclsiastiques

-- Write a query to find total monthly payroll (the sum of all the employees' monthly salaries).
SELECT SUM(salary)
FROM employees;
-- 20362.929931640625

-- Write a query to identify the highest salary and the lowest salary amounts which any employee makes. (Just the amounts, not the specific employees!)
SELECT MAX(salary), MIN(salary)
FROM employees;
-- MAX(3119.15) MIN(1744.21)

-- Write a query to find the name and supplier ID of each supplier and the number of items they supply. Hint: Join is your friend here.
SELECT s.SupplierID,
	   s.CompanyName,
	   COUNT(p.ProductID)
FROM suppliers as s
JOIN products as p ON p.SupplierID = s.SupplierID
GROUP BY s.SupplierID, s.CompanyName;

-- Write a query to find the list of all category names and the average price for items in each category.
SELECT c.CategoryName,
	   AVG(p.UnitPrice)
FROM categories as c
JOIN products as p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName;
       
-- Write a query to find, for all suppliers that provide at least 5 items to Northwind, what is the name of each supplier and the number of items they supply.
SELECT s.CompanyName, 
	   COUNT(p.ProductID)
FROM suppliers as s
JOIN products as p ON s.SupplierID = p.SupplierID 
GROUP BY s.CompanyName
HAVING COUNT(p.ProductID) >=5;
-- Pavlova, Ltd & Plutzer Lebensmittelgromrkte AG each supply 5

-- Write a query to list products currently in inventory by the product id, product name, and inventory value 
-- (calculated by multiplying unit price by the number of units on
-- hand). Sort the results in descending order by value. If two or more have the same
-- value, order by product name. If a product is not in stock, leave it off the list

SELECT ProductID,
	   ProductName,
       UnitPrice * UnitsInStock AS InventoryValue
FROM products
WHERE UnitsInStock > 0
ORDER BY InventoryValue DESC, ProductName
       