-- Seleccionar la base de datos SchoolStore
USE SchoolStore;

-- Crear la tabla ProductCategories
CREATE TABLE dbo.ProductCategories (
    category_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    category_name VARCHAR(100) NOT NULL
);

-- Crear la tabla Customers
CREATE TABLE dbo.Customers (
    customer_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NULL
);

-- Crear la tabla Products
CREATE TABLE dbo.Products (
    product_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    category_id INT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    CONSTRAINT FK_Products_ProductCategories FOREIGN KEY (category_id) REFERENCES dbo.ProductCategories(category_id)
);

-- Crear la tabla Orders
CREATE TABLE dbo.Orders (
    order_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    customer_id INT NULL,
    order_date DATE NULL,
    total DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_Orders_Customers FOREIGN KEY (customer_id) REFERENCES dbo.Customers(customer_id)
);

-- Crear la tabla OrderDetails
CREATE TABLE dbo.OrderDetails (
    detail_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    order_id INT NULL,
    product_id INT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_OrderDetails_Orders FOREIGN KEY (order_id) REFERENCES dbo.Orders(order_id),
    CONSTRAINT FK_OrderDetails_Products FOREIGN KEY (product_id) REFERENCES dbo.Products(product_id)
);


-- Seleccionar la base de datos SchoolStore
USE SchoolStore;

-- Insertar datos en la tabla ProductCategories
INSERT INTO dbo.ProductCategories (category_name) VALUES
('Electronics'),
('Clothing'),
('Books'),
('Furniture'),
('Toys'),
('Groceries'),
('Beauty'),
('Automotive'),
('Garden'),
('Music'),
('Sports'),
('Tools'),
('Office Supplies'),
('Pets'),
('Health');

-- Insertar datos en la tabla Customers
INSERT INTO dbo.Customers (name, email, phone) VALUES
('John Doe', 'john.doe@example.com', '1234567890'),
('Jane Smith', 'jane.smith@example.com', '2345678901'),
('Alice Johnson', 'alice.johnson@example.com', '3456789012'),
('Bob Brown', 'bob.brown@example.com', '4567890123'),
('Charlie Green', 'charlie.green@example.com', '5678901234'),
('Daisy Blue', 'daisy.blue@example.com', '6789012345'),
('Ethan White', 'ethan.white@example.com', '7890123456'),
('Fiona Black', 'fiona.black@example.com', '8901234567'),
('George Silver', 'george.silver@example.com', '9012345678'),
('Hannah Gold', 'hannah.gold@example.com', '0123456789'),
('Ian Copper', 'ian.copper@example.com', '1230987654'),
('Julia Red', 'julia.red@example.com', '2341098765'),
('Kevin Orange', 'kevin.orange@example.com', '3452109876'),
('Liam Yellow', 'liam.yellow@example.com', '4563210987'),
('Mia Violet', 'mia.violet@example.com', '5674321098'),
('Carlos Mendez', 'carlos.mendez@example.com', '1234567000'),
('Ana Torres', 'ana.torres@example.com', '1234567001'),
('Luis Ramirez', 'luis.ramirez@example.com', '1234567002');

-- Insertar datos en la tabla Products
INSERT INTO dbo.Products (category_id, name, description, price, stock) VALUES
(1, 'Laptop', 'A high performance laptop', 1200.00, 10),
(2, 'Smartphone', 'Latest model smartphone', 800.00, 20),
(3, 'Tablet', 'Portable and powerful tablet', 450.00, 15),
(4, 'Headphones', 'Noise-cancelling headphones', 150.00, 25),
(5, 'Smartwatch', 'Smartwatch with fitness tracking', 200.00, 30),
(6, 'Camera', 'Digital SLR camera', 500.00, 8),
(7, 'Printer', 'Wireless color printer', 100.00, 12),
(8, 'Monitor', '24-inch LED monitor', 180.00, 10),
(9, 'Keyboard', 'Mechanical keyboard', 80.00, 30),
(10, 'Mouse', 'Wireless mouse', 40.00, 35),
(11, 'Router', 'Dual-band Wi-Fi router', 120.00, 15),
(12, 'External HDD', '1TB external hard drive', 90.00, 20),
(13, 'Speaker', 'Bluetooth speaker', 60.00, 25),
(14, 'Microphone', 'USB condenser microphone', 110.00, 10),
(15, 'Webcam', '1080p HD webcam', 70.00, 15);

-- Insertar datos en la tabla Orders
INSERT INTO dbo.Orders (customer_id, order_date, total) VALUES
(1, '2024-01-01', 1200.00),
(2, '2024-02-01', 800.00),
(3, '2024-03-01', 450.00),
(4, '2024-04-01', 150.00),
(5, '2024-05-01', 200.00),
(6, '2024-06-01', 500.00),
(7, '2024-07-01', 100.00),
(8, '2024-08-01', 180.00),
(9, '2024-09-01', 80.00),
(10, '2024-10-01', 40.00),
(11, '2024-11-01', 120.00),
(12, '2024-12-01', 90.00),
(13, '2024-01-15', 60.00),
(14, '2024-02-15', 110.00),
(15, '2024-03-15', 70.00),
(1, '2024-01-05', 300.00),
(1, '2024-01-10', 450.00),
(2, '2024-02-05', 400.00),
(2, '2024-02-10', 350.00),
(3, '2024-03-05', 500.00),
(3, '2024-03-10', 550.00);

-- Insertar datos en la tabla OrderDetails
INSERT INTO dbo.OrderDetails (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 1200.00),
(2, 2, 1, 800.00),
(3, 3, 1, 450.00),
(4, 4, 1, 150.00),
(5, 5, 1, 200.00),
(6, 6, 1, 500.00),
(7, 7, 1, 100.00),
(8, 8, 1, 180.00),
(9, 9, 1, 80.00),
(10, 10, 1, 40.00),
(11, 11, 1, 120.00),
(12, 12, 1, 90.00),
(13, 13, 1, 60.00),
(14, 14, 1, 110.00),
(15, 15, 1, 70.00),
(1, 2, 2, 800.00),
(2, 3, 3, 450.00),
(3, 4, 1, 150.00),
(4, 5, 4, 200.00),
(5, 6, 2, 500.00);


-- Consulta que lista todos los productos disponibles en la tienda
SELECT 
    P.product_id, 
    P.name AS product_name, 
    P.description, 
    P.price, 
    P.stock, 
    PC.category_name
FROM 
    dbo.Products P
JOIN 
    dbo.ProductCategories PC ON P.category_id = PC.category_id
ORDER BY 
    P.product_id;

-- Consulta que muestra todos los detalles de los clientes, incluyendo su pedido más reciente
SELECT 
    C.customer_id, 
    C.name, 
    C.email, 
    C.phone, 
    O.order_id, 
    O.order_date, 
    O.total AS order_total
FROM 
    dbo.Customers C
LEFT JOIN 
    dbo.Orders O ON C.customer_id = O.customer_id
ORDER BY 
    C.customer_id, O.order_date DESC;

-- Definir la fecha específica para filtrar los pedidos
DECLARE @SpecificDate DATE = '2024-01-01';  -- Cambia la fecha según sea necesario

-- Consulta que revisa los pedidos realizados en una fecha específica, mostrando información del cliente y productos ordenados
SELECT 
    O.order_id, 
    C.customer_id, 
    C.name AS customer_name, 
    O.order_date, 
    O.total AS order_total, 
    P.product_id, 
    P.name AS product_name, 
    OD.quantity, 
    OD.unit_price, 
    (OD.quantity * OD.unit_price) AS total_price
FROM 
    dbo.Orders O
JOIN 
    dbo.Customers C ON O.customer_id = C.customer_id
JOIN 
    dbo.OrderDetails OD ON O.order_id = OD.order_id
JOIN 
    dbo.Products P ON OD.product_id = P.product_id
WHERE 
    O.order_date = @SpecificDate
ORDER BY 
    O.order_id;


-- Consulta con bucle WHILE para contar cuántas veces se ha pedido cada producto

-- Variables para el bucle
DECLARE @ProductID INT, @ProductName VARCHAR(100), @OrderCount INT;
DECLARE @CurrentProductID INT = (SELECT MIN(product_id) FROM dbo.Products);
DECLARE @MaxProductID INT = (SELECT MAX(product_id) FROM dbo.Products);

-- Tabla para almacenar los resultados
DECLARE @ProductOrderCounts TABLE (
    product_id INT,
    product_name VARCHAR(100),
    order_count INT
);

-- Bucle WHILE para contar los pedidos de cada producto
WHILE @CurrentProductID IS NOT NULL AND @CurrentProductID <= @MaxProductID
BEGIN
    SELECT @ProductName = name FROM dbo.Products WHERE product_id = @CurrentProductID;
    SELECT @OrderCount = COUNT(*) 
    FROM dbo.OrderDetails 
    WHERE product_id = @CurrentProductID;

    INSERT INTO @ProductOrderCounts (product_id, product_name, order_count) 
    VALUES (@CurrentProductID, @ProductName, @OrderCount);

    SET @CurrentProductID = (SELECT MIN(product_id) 
                             FROM dbo.Products 
                             WHERE product_id > @CurrentProductID);
END;

-- Seleccionar los resultados de la tabla temporal
SELECT * FROM @ProductOrderCounts;

-- --------------------------------------------------

-- Crear la función para contar cuántas veces se ha pedido cada producto
CREATE FUNCTION dbo.fn_ProductOrderCount (@ProductID INT)
RETURNS INT
AS
BEGIN
    DECLARE @OrderCount INT;
    SELECT @OrderCount = COUNT(*) 
    FROM dbo.OrderDetails 
    WHERE product_id = @ProductID;
    RETURN @OrderCount;
END;
GO

-- Consulta usando la función para obtener el conteo de pedidos de cada producto
SELECT 
    P.product_id, 
    P.name AS product_name, 
    dbo.fn_ProductOrderCount(P.product_id) AS order_count
FROM 
    dbo.Products P
ORDER BY 
    P.product_id;
