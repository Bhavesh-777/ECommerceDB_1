-- Use the project database
USE ecommerce_db;

-- Insert Customers
INSERT INTO Customers (Name, Email, Phone, Address, City, State, Country, ZipCode) VALUES
('Ravi Kumar', 'ravi.kumar@example.com', '9876543210', '123 Street A', 'Mumbai', 'MH', 'India', '400001'),
('Sneha Sharma', 'sneha.sharma@example.com', '9876501234', '45 Park Lane', 'Delhi', 'DL', 'India', '110001'),
('Amit Patel', 'amit.patel@example.com', '9876512345', '789 Green Street', 'Ahmedabad', 'GJ', 'India', '380001'),
('Priya Nair', 'priya.nair@example.com', '9876523456', '9 Blue Sky', 'Kochi', 'KL', 'India', '682001'),
('Rahul Yadav', 'rahul.yadav@example.com', '9876534567', '32 River Road', 'Lucknow', 'UP', 'India', '226001');

-- Insert Categories
INSERT INTO Categories (CategoryName, Description) VALUES
('Electronics', 'Gadgets and electronic devices'),
('Clothing', 'Men and Women clothing'),
('Books', 'Fiction and Non-fiction books');

-- Insert Products
INSERT INTO Products (ProductName, Description, Price, Stock, CategoryID) VALUES
('Smartphone', 'Android 5G smartphone', 19999.00, 50, 1),
('Laptop', '15 inch gaming laptop', 59999.00, 20, 1),
('Jeans', 'Blue denim jeans', 1299.00, 100, 2),
('T-Shirt', 'Cotton T-shirt', 499.00, 150, 2),
('Novel', 'Mystery fiction book', 299.00, 75, 3),
('Textbook', 'Data Structures textbook', 599.00, 40, 3);

-- Insert Orders
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, Status) VALUES
(1, '2024-03-01', 19999.00, 'Delivered'),
(2, '2024-03-02', 1798.00, 'Shipped'),
(3, '2024-03-05', 59999.00, 'Delivered'),
(4, '2024-03-08', 299.00, 'Processing'),
(1, '2024-03-10', 1898.00, 'Delivered'),
(5, '2024-03-12', 599.00, 'Cancelled');

-- Insert OrderDetails
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price) VALUES
(1, 1, 1, 19999.00),
(2, 3, 1, 1299.00),
(2, 4, 1, 499.00),
(3, 2, 1, 59999.00),
(4, 5, 1, 299.00),
(5, 3, 1, 1299.00),
(5, 4, 1, 599.00),
(6, 6, 1, 599.00);

-- Insert Payments
INSERT INTO Payments (OrderID, PaymentDate, PaymentMethod, Amount) VALUES
(1, '2024-03-01', 'UPI', 19999.00),
(2, '2024-03-02', 'Credit Card', 1798.00),
(3, '2024-03-05', 'Debit Card', 59999.00),
(4, '2024-03-08', 'UPI', 299.00),
(5, '2024-03-10', 'Cash on Delivery', 1898.00),
(6, '2024-03-12', 'Credit Card', 599.00);

-- Insert Shipping
INSERT INTO Shipping (OrderID, ShippingAddress, City, State, Country, ZipCode, ShippedDate, DeliveryDate, ShippingStatus) VALUES
(1, '123 Street A', 'Mumbai', 'MH', 'India', '400001', '2024-03-01', '2024-03-04', 'Delivered'),
(2, '45 Park Lane', 'Delhi', 'DL', 'India', '110001', '2024-03-03', '2024-03-06', 'Shipped'),
(3, '789 Green Street', 'Ahmedabad', 'GJ', 'India', '380001', '2024-03-05', '2024-03-08', 'Delivered'),
(4, '9 Blue Sky', 'Kochi', 'KL', 'India', '682001', NULL, NULL, 'Processing'),
(5, '123 Street A', 'Mumbai', 'MH', 'India', '400001', '2024-03-11', '2024-03-14', 'Delivered'),
(6, '32 River Road', 'Lucknow', 'UP', 'India', '226001', '2024-03-12', NULL, 'Cancelled');

select * from shipping;