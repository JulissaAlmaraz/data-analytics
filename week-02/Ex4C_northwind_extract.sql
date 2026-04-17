/*
4A) What is the name of the table that holds the items northwind sells?
-Products
4B) What is the name of the table that holds the types/categories of the items northwind sells?
-Categories
5. SELECT * FROM employees
A)Who is the name of the employee whose name makes it look like she's a bird?
Margaret
6. SELECT * FROM products
A) How many records does the query return? 77. I can use Limit to 10 to only return 10 rows.
b) BONUS How could you write the query to limit the number of rows returned? the query would be:alter
SELECT *
FROM products
LIMIT 10
7. Create another SELECT statement to retrieve all columns from the categories table. 
SELECT *
FROM categories
c) What is the category id of seafood? 8.
8. Create a final SELECT statement to retrieve the top 50 records from orders, including only the OrderID,
OrderDate, ShipName, and ShipCountry columns
SELECT OrderID, OrderDate, ShipName, ShipCountry
FROM orders
LIMIT 50

*/