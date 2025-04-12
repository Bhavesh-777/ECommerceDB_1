-- 1. List all customers
SELECT * FROM Customers;

-- 2. List all products with their category
SELECT p.ProductID, p.ProductName, p.Price, p.Stock, c.CategoryName
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID;

-- 3. List all orders with customer name and total amount
SELECT o.OrderID, c.Name AS CustomerName, o.OrderDate, o.TotalAmount, o.Status
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID;

-- 4. Show order details for a specific order
SELECT od.OrderID, p.ProductName, od.Quantity, od.Price
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
WHERE od.OrderID = 1;

-- 5. List payments with order and customer details
SELECT p.PaymentID, p.PaymentDate, p.PaymentMethod, p.Amount, c.Name AS CustomerName
FROM Payments p
JOIN Orders o ON p.OrderID = o.OrderID
JOIN Customers c ON o.CustomerID = c.CustomerID;

-- 6. Show products with stock less than 50
SELECT ProductName, Stock
FROM Products
WHERE Stock < 50;

-- 7. Orders with their shipping status
SELECT o.OrderID, c.Name AS CustomerName, s.ShippingStatus, s.ShippedDate, s.DeliveryDate
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Shipping s ON o.OrderID = s.OrderID;

-- 8. Count total orders per customer
SELECT c.Name, COUNT(o.OrderID) AS TotalOrders
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.Name;

-- 9. Revenue generated from each product
SELECT p.ProductName, SUM(od.Quantity * od.Price) AS Revenue
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY Revenue DESC;

-- 10. Total revenue per day
SELECT OrderDate, SUM(TotalAmount) AS DailyRevenue
FROM Orders
GROUP BY OrderDate
ORDER BY OrderDate;

