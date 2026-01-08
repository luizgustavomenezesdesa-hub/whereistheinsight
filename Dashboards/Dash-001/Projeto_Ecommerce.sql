

CREATE TABLE clients (
    client_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    cpf VARCHAR(11) UNIQUE,
    cnpj VARCHAR(14) UNIQUE,
    CHECK ((cpf IS NOT NULL AND cnpj IS NULL) OR (cpf IS NULL AND cnpj IS NOT NULL))
);

CREATE TABLE addresses (
    address_id SERIAL PRIMARY KEY,
    client_id INT NOT NULL REFERENCES clients(client_id),
    street VARCHAR(200),
    city VARCHAR(100),
    state VARCHAR(50),
    zipcode VARCHAR(20)
);

CREATE TABLE suppliers (
    supplier_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL
);

CREATE TABLE sellers (
    seller_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    price NUMERIC(10,2) NOT NULL
);

CREATE TABLE product_suppliers (
    product_id INT REFERENCES products(product_id),
    supplier_id INT REFERENCES suppliers(supplier_id),
    PRIMARY KEY(product_id, supplier_id)
);

CREATE TABLE stock (
    product_id INT PRIMARY KEY REFERENCES products(product_id),
    quantity INT NOT NULL
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    client_id INT REFERENCES clients(client_id),
    order_date TIMESTAMP DEFAULT NOW()
);

CREATE TABLE order_items (
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT NOT NULL,
    PRIMARY KEY(order_id, product_id)
);

CREATE TABLE payment_methods (
    payment_id SERIAL PRIMARY KEY,
    client_id INT REFERENCES clients(client_id),
    type VARCHAR(50) NOT NULL
);

CREATE TABLE order_payments (
    order_id INT REFERENCES orders(order_id),
    payment_id INT REFERENCES payment_methods(payment_id),
    PRIMARY KEY(order_id, payment_id)
);

CREATE TABLE shipments (
    shipment_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    tracking_code VARCHAR(100),
    status VARCHAR(50)
);

INSERT INTO clients (name, cpf) VALUES
('João Silva', '12345678901'),
('Empresa XPTO', NULL),
('Maria Santos', '98765432100');

UPDATE clients SET cnpj = '11223344556677' WHERE name = 'Empresa XPTO';

INSERT INTO products (name, price) VALUES
('Notebook', 3500.00),
('Teclado Mecânico', 450.00),
('Mouse Gamer', 250.00);

INSERT INTO suppliers (name) VALUES
('TecSupply'),
('HardwareMax');

INSERT INTO product_suppliers VALUES
(1,1),(2,1),(2,2),(3,2);

INSERT INTO stock VALUES
(1, 50), (2, 120), (3, 80);

INSERT INTO orders (client_id) VALUES (1),(1),(3);

INSERT INTO order_items VALUES
(1,1,1),(1,3,2),(2,2,1),(3,3,1);

INSERT INTO payment_methods (client_id, type) VALUES
(1,'Crédito'),(1,'Pix'),(3,'Débito');

INSERT INTO order_payments VALUES
(1,1),(2,2),(3,3);

INSERT INTO shipments (order_id, tracking_code, status) VALUES
(1,'BR123','Enviado'),
(2,'BR456','Entregue'),
(3,'BR789','Separando');

-- Queries

SELECT client_id, COUNT(*) AS total_pedidos
FROM orders
GROUP BY client_id;

SELECT s.name AS vendedor, f.name AS fornecedor
FROM sellers s
JOIN suppliers f ON s.name = f.name;

SELECT p.name, s.name AS fornecedor
FROM products p
JOIN product_suppliers ps ON p.product_id = ps.product_id
JOIN suppliers s ON s.supplier_id = ps.supplier_id;

SELECT p.name, stock.quantity
FROM products p
JOIN stock ON p.product_id = stock.product_id
ORDER BY quantity DESC;

SELECT c.name, SUM(oi.quantity * p.price) AS total_gasto
FROM clients c
JOIN orders o ON c.client_id = o.client_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON p.product_id = oi.product_id
GROUP BY c.name
HAVING SUM(oi.quantity * p.price) > 500;
