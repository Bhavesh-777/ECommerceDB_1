USE ecommerce_db; //

-- 1. Stored Procedure to Insert a New Customer
DELIMITER //
CREATE PROCEDURE InsertCustomer(
    IN p_name VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_city VARCHAR(50)
)
BEGIN
    INSERT INTO Customers (CustomerName, Email, City)
    VALUES (p_name, p_email, p_city);
END;
//
DELIMITER ;

-- 2. Stored Procedure to Insert a New Order with Order Details
DELIMITER //
CREATE PROCEDURE PlaceOrder(
    IN p_customerID INT,
    IN p_productID INT,
    IN p_quantity INT,
    IN p_orderDate DATE,
    IN p_shippingMethod VARCHAR(100)
)
BEGIN
    DECLARE orderID INT;
    
    -- Insert into Orders
    INSERT INTO Orders (CustomerID, OrderDate)
    VALUES (p_customerID, p_orderDate);
    
    SET orderID = LAST_INSERT_ID();

    -- Insert into OrderDetails
    INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
    VALUES (orderID, p_productID, p_quantity);

    -- Insert into Shipping
    INSERT INTO Shipping (OrderID, ShippingMethod, ShippingDate)
    VALUES (orderID, p_shippingMethod, DATE_ADD(p_orderDate, INTERVAL 3 DAY));
END;
//
DELIMITER ;

-- 3. Stored Procedure to Get Orders by a Specific Customer
DELIMITER //
CREATE PROCEDURE GetOrdersByCustomer(
    IN p_customerID INT
)
BEGIN
    SELECT 
        o.OrderID,
        o.OrderDate,
        p.ProductName,
        od.Quantity,
        s.ShippingMethod,
        s.ShippingDate
    FROM Orders o
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    JOIN Products p ON od.ProductID = p.ProductID
    JOIN Shipping s ON o.OrderID = s.OrderID
    WHERE o.CustomerID = p_customerID;
END;
//
DELIMITER ;





