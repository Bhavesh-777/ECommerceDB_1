-- Switching to the e_commerce_db
USE e_commerce_db;

-- ✅ TRIGGERS

-- 1. Trigger: After Insert on Orders → Insert into Order_Audit
DELIMITER //
CREATE TRIGGER after_order_insert
AFTER INSERT ON Orders
FOR EACH ROW
BEGIN
  INSERT INTO Order_Audit(order_id, customer_id, order_date, action, action_date)
  VALUES (NEW.order_id, NEW.customer_id, NEW.order_date, 'INSERT', NOW());
END;
//
DELIMITER ;

-- 2. Trigger: After Delete on Orders → Insert into Order_Audit
DELIMITER //
CREATE TRIGGER after_order_delete
AFTER DELETE ON Orders
FOR EACH ROW
BEGIN
  INSERT INTO Order_Audit(order_id, customer_id, order_date, action, action_date)
  VALUES (OLD.order_id, OLD.customer_id, OLD.order_date, 'DELETE', NOW());
END;
//
DELIMITER ;

-- 3. Trigger: Before Update on Orders → Prevent Changing Customer ID
DELIMITER //
CREATE TRIGGER before_order_update
BEFORE UPDATE ON Orders
FOR EACH ROW
BEGIN
  IF NEW.customer_id <> OLD.customer_id THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Changing customer_id is not allowed!';
  END IF;
END;
//
DELIMITER ;

-- ✅ INDEXING

-- 1. Index on Customers (last_name)
CREATE INDEX idx_customers_last_name
ON Customers(last_name);

-- 2. Index on Orders (order_date)
CREATE INDEX idx_orders_order_date
ON Orders(order_date);

-- 3. Composite Index on Order_Items (product_id, quantity)
CREATE INDEX idx_order_items_product_quantity
ON Order_Items(product_id, quantity);




