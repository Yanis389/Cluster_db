CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    stock INTEGER
);

INSERT INTO products (name, price, stock) VALUES
('MacBook Pro M1', 1299.99, 10),
('Clavier Mécanique', 89.50, 50),
('Souris sans fil', 45.00, 100);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    product_id INTEGER REFERENCES products(id),
    quantity INTEGER,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
EOF