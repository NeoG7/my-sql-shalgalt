-- CREATE DATABASE store_db;

-- USE store_db;

-- CREATE TABLE Products (
--     product_id INT AUTO_INCREMENT PRIMARY KEY,  -- Бүтээгдэхүүний ID
--     name VARCHAR(255) NOT NULL,                  -- Бүтээгдэхүүний нэр
--     price DECIMAL(10, 2) NOT NULL,               -- Бүтээгдэхүүний үнэ
--     category VARCHAR(100),                       -- Бүтээгдэхүүний төрөл
--     stock_quantity INT NOT NULL                 -- Барааны үлдэгдэл
-- );

-- CREATE TABLE Users (
--     user_id INT AUTO_INCREMENT PRIMARY KEY,     -- Хэрэглэгчийн ID
--     name VARCHAR(255) NOT NULL,                  -- Хэрэглэгчийн нэр
--     email VARCHAR(255) UNIQUE NOT NULL,          -- Хэрэглэгчийн имэйл хаяг
--     phone_number VARCHAR(15)                    -- Хэрэглэгчийн утасны дугаар
-- );

-- CREATE TABLE Orders (
--     order_id INT AUTO_INCREMENT PRIMARY KEY,    -- Захиалгын ID
--     user_id INT,                                -- Хэрэглэгчийн ID (Гадаад түлхүүр)
--     order_date DATE NOT NULL,                   -- Захиалгын огноо
--     total_price DECIMAL(10, 2) NOT NULL,        -- Захиалгын нийт үнэ
--     FOREIGN KEY (user_id) REFERENCES Users(user_id)  -- Хэрэглэгчтэй холбоотой
-- );

-- CREATE TABLE Order_Details (
--     order_detail_id INT AUTO_INCREMENT PRIMARY KEY,  -- Захиалгын дэлгэрэнгүй мэдээллийн ID
--     order_id INT,                                    -- Захиалгын ID (Гадаад түлхүүр)
--     product_id INT,                                  -- Бүтээгдэхүүний ID (Гадаад түлхүүр)
--     quantity INT NOT NULL,                           -- Тоо хэмжээ
--     FOREIGN KEY (order_id) REFERENCES Orders(order_id),  -- Захиалга хүснэгттэй холбоотой
--     FOREIGN KEY (product_id) REFERENCES Products(product_id)  -- Бүтээгдэхүүн хүснэгттэй холбоотой
-- );

-- INSERT INTO Products (name, price, category, stock_quantity) VALUES
-- ('Product 1', 15000.00, 'Category A', 100),
-- ('Product 2', 20000.00, 'Category B', 50),
-- ('Product 3', 12000.00, 'Category A', 75),
-- ('Product 4', 50000.00, 'Category C', 20),
-- ('Product 5', 30000.00, 'Category B', 40);

-- INSERT INTO Users (name, email, phone_number) VALUES
-- ('User 1', 'user1@example.com', '99001122'),
-- ('User 2', 'user2@example.com', '99003344'),
-- ('User 3', 'user3@example.com', '99005566');

-- INSERT INTO Orders (user_id, order_date, total_price) VALUES
-- (1, '2024-12-05', 35000.00);

-- INSERT INTO Order_Details (order_id, product_id, quantity) VALUES
-- (1, 1, 2),
-- (1, 3, 1);

-- SELECT name, price FROM Products;

-- SELECT P.name, O.total_price 
-- FROM Order_Details OD
-- JOIN Products P ON OD.product_id = P.product_id
-- JOIN Orders O ON OD.order_id = O.order_id
-- WHERE O.order_id = 1;

-- SELECT U.name, COUNT(O.order_id) AS total_orders, SUM(O.total_price) AS total_spent
-- FROM Users U
-- JOIN Orders O ON U.user_id = O.user_id
-- GROUP BY U.user_id;

-- CREATE VIEW order_summary AS
-- SELECT O.order_id, U.name AS user_name, O.order_date, O.total_price, P.name AS product_name, OD.quantity
-- FROM Orders O
-- JOIN Users U ON O.user_id = U.user_id
-- JOIN Order_Details OD ON O.order_id = OD.order_id
-- JOIN Products P ON OD.product_id = P.product_id;

-- CREATE TABLE Suppliers (
--     supplier_id INT PRIMARY KEY AUTO_INCREMENT,
--     supplier_name VARCHAR(100),
--     supplier_contact VARCHAR(50)
-- );

-- ALTER TABLE Products
-- ADD supplier_id INT,
-- ADD FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id);
	
-- INSERT INTO Suppliers (supplier_name, supplier_contact) 
-- VALUES ('TechSupply Inc.', '123-456-7890');

-- UPDATE Products 
-- SET supplier_id = 1
-- WHERE product_id = 1;

-- CREATE VIEW supplier_product_summary AS
-- SELECT 
--     S.supplier_name,
--     P.product_name,
--     P.product_category
-- FROM 
--     Suppliers S
-- JOIN 
--     Products P ON S.supplier_id = P.supplier_id;

-- SELECT 
--     S.supplier_name, 
--     COUNT(P.product_id) AS number_of_products
-- FROM 
--     Suppliers S
-- JOIN 
--     Products P ON S.supplier_id = P.supplier_id
-- GROUP BY 
--     S.supplier_name;

-- SELECT 
--     P.product_category, 
--     S.supplier_name
-- FROM 
--     Suppliers S
-- JOIN 
--     Products P ON S.supplier_id = P.supplier_id
-- GROUP BY 
--     P.product_category, S.supplier_name;

-- UPDATE Products SET stock_quantity = stock_quantity - 1 WHERE product_id = 1;

-- DELETE FROM Order_Details WHERE order_id = 1 AND product_id = 1;



