SELECT *
FROM Categories;

SELECT DISTINCT Country
FROM Customers;

SELECT COUNT(DISTINCT Country)
FROM Customers;

SELECT FirstName, LastName, BirthDate
FROM employees;

SELECT CustomerName, Address, City
FROM customers;

SELECT DISTINCT City
FROM suppliers;

SELECT COUNT(DISTINCT City)
FROM customers;

SELECT *
FROM customers
WHERE Country <> "Germany" AND  Country <> "UK";

SELECT *
FROM customers
WHERE City = "London";

SELECT COUNT(CustomerID)
FROM customers
WHERE Country = "USA";

SELECT *
FROM customers
WHERE CustomerID >= 15;

SELECT *
FROM customers
WHERE City = "Berlin" OR City = "Stuttgart";

SELECT *
FROM customers
WHERE City = "London" AND Country = "UK";

SELECT *
FROM customers
WHERE City = "Portland" OR City = "Kirkland";

SELECT * 
FROM orders
WHERE OrderDate < "1996-08-27" OR OrderDate > "1997-02-21";

SELECT *
FROM customers
WHERE customername LIKE "_e%";

SELECT *
FROM suppliers 
WHERE Country LIKE "%land%";

SELECT *
FROM employees
WHERE FirstName LIKE "_n%";

SELECT *
FROM Customers
WHERE Country IN("Germany","UK","France");

SELECT *
FROM Customers
WHERE Country NOT IN("Germany","UK","France");

SELECT *
FROM Customers
WHERE City IN("Berlin","Paris","Madrid");

SELECT *
FROM Orders
WHERE ShipperID IN(1,3);

SELECT *
FROM Products
WHERE Price BETWEEN 10 AND 20;

SELECT *
FROM Customers
ORDER BY Country DESC;

SELECT *
FROM Customers
ORDER BY Country
LIMIT 3;

SELECT max(productname)
FROM products;

SELECT avg(price)
FROM products;

SELECT sum(price)
FROM products;

SELECT CustomerName, CONCAT_WS(', ', Address, PostalCode, City, Country) AS Address
FROM Customers;

SELECT AVG(price) AS Average, productname
FROM products;

SELECT *
FROM Customers
WHERE CustomerID IN(SELECT CustomerID 
FROM orders 
WHERE OrderID IN(SELECT OrderID 
FROM Order_details 
WHERE Quantity>50));

SELECT *
FROM Orders
INNER JOIN Customers
ON Orders.customerID = customers.CustomerID;

SELECT FirstName, LastName, orderID
FROM Employees
INNER JOIN Orders
on Employees.EmployeeID = Orders.EmployeeID
ORDER BY OrderID;

SELECT *
FROM Products
INNER JOIN Suppliers
ON Products.SupplierID = Suppliers.SupplierID
WHERE SupplierName = "G'Day, Mate";

SELECT FirstName, LastName, OrderDate
FROM Employees
INNER JOIN Orders
ON Employees.EmployeeID = Orders.EmployeeID;

SELECT OrderID, OrderDate, ShipperName
FROM Orders
INNER JOIN Shippers
ON Orders.ShipperID = Shippers.ShipperID
WHERE ShipperName = "Speedy Express";

SELECT ProductName, CategoryName
FROM Products
INNER JOIN Categories
ON Products.CategoryID = Categories.CategoryID;

SELECT ProductName, OrderID, Quantity 
FROM Products
INNER JOIN Order_Details
ON Products.ProductID = Order_Details.ProductID;

SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees 
ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;


SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;

/*Return only missing values*/
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
where orderid is null;
/* customers with no orders*/

/* alisaing*/
SELECT c.CustomerName, o.OrderID
FROM Customers as c -- rename as c
LEFT JOIN Orders as o -- rename as o
ON c.CustomerID = o.CustomerID
where orderid is null;

SELECT COUNT(CustomerID),Country
FROM Customers
GROUP BY Country;

-- Lists Total orders by each shipper
SELECT Count(OrderID) as TotalOrders, ShipperName
FROM Shippers as s
LEFT JOIN Orders as o
ON s.ShipperID = o.ShipperID
GROUP BY ShipperName;

-- Lists Total Sales by each product
SELECT p.ProductName, SUM(od.Quantity * p.Price) AS TotalSales
FROM Order_Details as od
JOIN Products as p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalSales DESC;

SELECT Country, Count(CustomerID) as TotalCustomers
FROM Customers
GROUP BY Country;

SELECT CategoryName, Sum(Quantity) as TotalQuantity
FROM Categories as c
JOIN Products as p
ON c.CategoryID = p.CategoryID
JOIN Order_Details as od
ON od.ProductID = p.ProductID
GROUP BY CategoryName;

SELECT concat_ws(" ",FirstName,LastName) as Employee, Count(OrderID) as TotalOrders
FROM Orders as o
JOIN Employees as e
ON o.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeID;

SELECT SupplierName, ProductName
From Products as p
JOIN Suppliers as s
ON p.SupplierID = s.SupplierID;

SELECT ProductName, CategoryName
FROM Products as p
JOIN Categories as c
ON p.CategoryID = c.CategoryID;

SELECT ProductName
FROM Products as p
JOIN Categories as c
ON p.CategoryID = c.CategoryID
WHERE CategoryName = "Meat/Poultry";

SELECT OrderID, OrderDate, CustomerName, concat_ws(" ", FirstName, LastName) as Employee
FROM Orders as o
JOIN Customers as c
ON o.CustomerID = c.CustomerID
JOIN Employees as e
ON o.EmployeeID = e.EmployeeID;

SELECT ProductName, CategoryName, SupplierName
FROM Products as p
JOIN Categories as c
ON p.CategoryID = c.CategoryID
JOIN Suppliers as s
ON p.SupplierID = s.SupplierID;

SELECT OrderDate, OrderID, CustomerName, ContactName, Address, City, Country
FROM Orders as o
JOIN Customers as c
ON o.CustomerID = c.CustomerID
WHERE YEAR(OrderDate) = 1996;

SELECT CategoryName, COUNT(ProductID) as Total_Products
FROM Products as p
JOIN Categories as c
ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryID;

SELECT ProductName, Price, SUM(Quantity) as Quantity_Ordered
FROM Products as p
JOIN Order_details as od
ON p.ProductID = od.ProductID
GROUP BY od.ProductID;