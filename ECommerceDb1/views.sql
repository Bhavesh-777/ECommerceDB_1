-- 1. View: Customer Order Summary
CREATE OR REPLACE VIEW vw_customer_order_summary AS
SELECT 
    c.CustomerID,
    c.Name AS CustomerName,
    COUNT(o.OrderID) AS TotalOrders,
    SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name;

-- 2. View: Product Sales Summary
CREATE OR REPLACE VIEW vw_product_sales_summary AS
SELECT 
    p.ProductID,
    p.ProductName,
    SUM(od.Quantity) AS TotalSold,
    SUM(od.Quantity * od.Price) AS TotalRevenue,
    p.Stock
FROM Products p
LEFT JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName, p.Stock;

-- 3. View: Daily Revenue
CREATE OR REPLACE VIEW vw_daily_revenue AS
SELECT 
    OrderDate,
    SUM(TotalAmount) AS Revenue
FROM Orders
GROUP BY OrderDate;

-- 4. View: Order Details with Product Info
CREATE OR REPLACE VIEW vw_order_details_expanded AS
SELECT 
    od.OrderID,
    c.Name AS CustomerName,
    p.ProductName,
    od.Quantity,
    od.Price,
    (od.Quantity * od.Price) AS TotalPrice,
    o.OrderDate,
    o.Status
FROM OrderDetails od
JOIN Orders o ON od.OrderID = o.OrderID
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Products p ON od.ProductID = p.ProductID;

-- 5. View: Shipping Info with Orders
CREATE OR REPLACE VIEW vw_shipping_summary AS
SELECT 
    o.OrderID,
    c.Name AS CustomerName,
    s.ShippingStatus,
    s.ShippedDate,
    s.DeliveryDate,
    o.Status AS OrderStatus
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Shipping s ON o.OrderID = s.OrderID;
