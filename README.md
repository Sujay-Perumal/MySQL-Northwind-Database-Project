# 🗄️ Northwind SQL Analysis (MySQL)

![MySQL](https://img.shields.io/badge/MySQL-Database%20Development-00618A?logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Data%20Analysis-4479A1)
![Joins](https://img.shields.io/badge/Advanced-JOINs-blueviolet)
![Queries](https://img.shields.io/badge/Queries-40%2B-success)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

A structured SQL analysis project using the **Northwind** sample database.  
This repository highlights practical SQL experience across **data querying**, **joins**, **aggregation**, and **business logic**, aligned with real-world analytics workflows.

---

## 📁 Project Overview

This project contains 40+ MySQL queries exploring core business entities:

- Customers  
- Orders  
- Products  
- Categories  
- Suppliers  
- Employees  
- Shippers  

The script serves as both a **learning module** and a **reference library** for SQL-based analysis.

---

## 🧠 Skills Demonstrated

### 📌 Core SQL Competencies
- Selecting, filtering, sorting:  
  `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`, `LIKE`, `BETWEEN`, `IN`  
- Text transformation using `CONCAT_WS`  
- Data exploration & profiling

### 🔗 Relational Joins
Extensive use of:

- `INNER JOIN`  
- `LEFT JOIN`  
- `RIGHT JOIN`  
- Multi-table joins  
- Identifying missing relationships (e.g., customers without orders)

### 📊 Aggregations & Business Metrics
Using `COUNT`, `SUM`, `AVG`, `MAX` to compute:

- Total revenue per product  
- Total orders by shipper  
- Customer counts per region  
- Employee order volume  
- Category-level quantity sold  

### 🧩 Subqueries
Examples include:

- Customers with high-quantity orders  
- Filtering using nested `IN (SELECT...)` queries  
- Dependent logic across multiple tables  

---

## 📊 Key Analytical Queries

### **1️⃣ Customer & Geography Analysis**
```sql
SELECT DISTINCT Country FROM Customers;
SELECT COUNT(DISTINCT City) FROM Customers; 
```

### **2️⃣ Product–Category Join**
```sql
SELECT ProductName, CategoryName
FROM Products AS p
JOIN Categories AS c 
ON p.CategoryID = c.CategoryID;
```

### **3️⃣ Revenue by Product**
```sql
SELECT p.ProductName, SUM(od.Quantity * p.Price) AS TotalSales
FROM Order_Details AS od
JOIN Products AS p 
ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalSales DESC;
```

### **4️⃣ High-Quantity Order Customers**
```sql
SELECT *
FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Orders
    WHERE OrderID IN (
        SELECT OrderID
        FROM Order_Details
        WHERE Quantity > 50
    )
);
```
