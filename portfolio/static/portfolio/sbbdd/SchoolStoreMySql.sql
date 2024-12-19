-- Creacion de índices para las diferentes tablas
use schoolstore;

CREATE INDEX idx_orders_customer_id ON Orders (customer_id);
CREATE INDEX idx_orderdetails_order_id ON OrderDetails (order_id);

CREATE INDEX idx_products_category_id ON Products (category_id);

CREATE INDEX idx_orderdetails_product_id ON OrderDetails (product_id);

CREATE INDEX idx_customers_name ON Customers (name);


-- Consulta 1: Calcular el total de ventas por cada categoría de producto

USE schoolstore;

-- Seleccionar el nombre de la categoría y el total de ventas
SELECT 
    pc.category_name AS Category,       -- Selecciona el nombre de la categoría y lo alias como "Category"
    SUM(od.quantity * od.unit_price) AS TotalSales  -- Suma el total de ventas (cantidad por precio unitario) y lo alias como "TotalSales"
FROM 
    OrderDetails od                    -- Tabla de detalles de pedidos
    JOIN Products p ON od.product_id = p.product_id   -- Une OrderDetails con Products basado en product_id
    JOIN ProductCategories pc ON p.category_id = pc.category_id  -- Une Products con ProductCategories basado en category_id
GROUP BY 
    pc.category_name;                  -- Agrupa los resultados por nombre de la categoría

-- Consulta 2: Calcular el gasto promedio por cada cliente

-- Asegurarse de que estamos utilizando la base de datos correcta
USE schoolstore;

-- Seleccionar el nombre del cliente, la suma total de sus pedidos y el gasto promedio
SELECT 
    c.name AS CustomerName,           -- Selecciona el nombre del cliente y lo alias como "CustomerName"
    SUM(o.total) AS TotalSpent,       -- Suma el total de pedidos y lo alias como "TotalSpent"
    AVG(o.total) AS AverageSpent      -- Calcula el promedio de los pedidos y lo alias como "AverageSpent"
FROM 
    Customers c                      -- Tabla de clientes
    JOIN Orders o ON c.customer_id = o.customer_id  -- Une Customers con Orders basado en customer_id
GROUP BY 
    c.name;                          -- Agrupa los resultados por nombre del cliente

-- Consulta 3: Listar los productos más vendidos en orden descendente

-- Asegurarse de que estamos utilizando la base de datos correcta
USE schoolstore;

-- Seleccionar el nombre del producto, la cantidad total pedida y ordenar los resultados
SELECT 
    p.name AS ProductName,           -- Selecciona el nombre del producto y lo alias como "ProductName"
    SUM(od.quantity) AS TotalOrdered -- Suma la cantidad total pedida y lo alias como "TotalOrdered"
FROM 
    OrderDetails od                  -- Tabla de detalles de pedidos
    JOIN Products p ON od.product_id = p.product_id -- Une OrderDetails con Products basado en product_id
GROUP BY 
    p.name                           -- Agrupa los resultados por nombre del producto
ORDER BY 
    TotalOrdered DESC;               -- Ordena los resultados de mayor a menor cantidad pedida

-- Consulta 4: Verificar los clientes que no han hecho ningún pedido

-- Asegurarse de que estamos utilizando la base de datos correcta
USE schoolstore;

-- Seleccionar el nombre del cliente y otras columnas relevantes, y filtrar los resultados para encontrar clientes sin pedidos
SELECT 
    c.customer_id AS CustomerID,     -- Selecciona el ID del cliente y lo alias como "CustomerID"
    c.name AS CustomerName,          -- Selecciona el nombre del cliente y lo alias como "CustomerName"
    c.email AS CustomerEmail         -- Selecciona el email del cliente y lo alias como "CustomerEmail"
FROM 
    Customers c                      -- Tabla de clientes
    LEFT JOIN Orders o ON c.customer_id = o.customer_id  -- Une Customers con Orders basado en customer_id usando LEFT JOIN
WHERE 
    o.order_id IS NULL;              -- Filtra los resultados para mostrar solo los clientes sin pedidos (valores nulos en order_id)

----Copia de seguridad backup de la base de datos realizada:
-- mysqldump -u root -p SchoolStore > C:\ruta\deseada\SchoolStore_backup.sql
