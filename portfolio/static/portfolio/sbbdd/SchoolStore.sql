-- Creación de la base de datos
CREATE DATABASE SchoolStore;
USE SchoolStore;

-- Tabla Products
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) CHECK (price > 0),
    stock INT CHECK (stock >= 0)
);

-- Tabla Customers
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15)
);

-- Tabla Orders
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total DECIMAL(10, 2) CHECK (total >= 0),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Tabla OrderDetails
CREATE TABLE OrderDetails (
    detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT CHECK (quantity > 0),
    unit_price DECIMAL(10, 2) CHECK (unit_price > 0),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
