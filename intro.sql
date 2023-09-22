-- Programiz Online SQL Editor

SELECT age
FROM customers;

SELECT DISTINCT item
FROM orders; -- ';' Separa dal successivo

SELECT DISTINCT country
FROM customers;

SELECT DISTINCT item, amount
FROM orders
ORDER BY amount desc; -- desc = Descending, di default è ascendente

SELECT first_name, last_name
FROM customers
ORDER BY last_name, first_name;

SELECT DISTINCT item, amount
FROM orders
ORDER BY amount desc
LIMIT 3;

SELECT * -- '*' = Tutto
FROM customers
WHERE NOT (age > 24 or country = 'USA') -- (...) Indica ordine operazioni
ORDER BY age;

SELECT *
FROM orders
WHERE amount >= 300 and item != 'Keyboard'; -- != Significa diverso 

SELECT *
FROM orders
WHERE item in ('Keyboard', 'Mouse');

SELECT DISTINCT country
FROM customers;

SELECT COUNT(*)
FROM customers;

SELECT COUNT(DISTINCT country)
FROM customers;

SELECT COUNT(*)
FROM customers
WHERE country = 'UK';

SELECT COUNT(*)
FROM shippings
WHERE lower(status) = 'pending';

SELECT AVG(age) -- AVG = Average
FROM customers;

SELECT MAX(age)
FROM customers;

SELECT MIN(age)
FROM customers;

SELECT MIN(age), MAX(age), (MAX(age) - MIN(age)) as Diff -- as come valore dato (Diff)
FROM customers;

SELECT country, COUNT(*) as Value
FROM customers
GROUP BY country;

SELECT country, AVG(age) as Value
FROM customers
GROUP BY country;

SELECT item, SUM(amount)
FROM orders
GROUP BY item;

SELECT customer_id, AVG(amount), MAX(amount)
FROM orders
GROUP BY customer_id
ORDER BY AVG(amount) desc
LIMIT 3;

SELECT count(*)
FROM customers
WHERE country = 'UK';

UPDATE customers
SET age = 35
WHERE first_name = 'John' and last_name = 'Doe';

UPDATE customers
SET
    age = 37
    first_name = 'Sam'
WHERE customer_id = 1;

UPDATE customers
SET age = (
    SELECT age
    FROM customers
    WHERE customer_id = 4
)
WHERE customer_id = 1;

UPDATE orders 
SET amount = (
    -- Sottoquery / Subquery
    SELECT amount
    FROM orders
    WHERE item = 'Mouse'
)
WHERE item = 'Keyboard';

SELECT *
FROM orders
LIMIT 2
OFFSET 4;

DELETE FROM customers
WHERE customer_id = 1;

DELETE FROM orders
WHERE item = 'Keyboard';
-- Cascade / Cascading

INSERT INTO customers(customer_id, age, country, first_name, last_name)
VALUES(6, 40, 'IT', 'Mario', 'Rossi');

INSERT INTO orders(order_id, item, amount, customer_id)
SELECT order_id + 5, item, amount, 6
FROM orders
WHERE customer_id = 4;

INSERT INTO (customer_id, first_name, last_name)
VALUES(7, 'Pippo', 'Lintonaco');

-- NULL
SELECT *
FROM customers
WHERE age is null;

-- Logica binaria: true, false
-- Logica ternaria: true, false, null (unknown)
-- NULL -> UNKNOWN, SCONOSCIUTO

UPDATE customers
SET country = null
WHERE customer_id = 4;

SELECT country
FROM customers
WHERE customer_id in (
    SELECT customer_id
    FROM orders
    WHERE item = 'Keyboard'
);

SELECT *
FROM customers
WHERE customer_id in -- in -> .includes()
(
    SELECT customer_id
    FROM orders
    WHERE amount > 350 
) -- lista/array di valori dell'includes

-- Per tutti gli ordini voglio vedere...
-- 1) Oggetto acquistato
-- 2) Soldi spesi per quell'oggetto
-- 3) Nome e Cognome del cliente

-- JOIN

SELECT *
FROM orders, customers
WHERE orders.customers_id = customers.customer_id

-- ID spedizione, stato spedizione, nazionalità del cliente
SELECT s.shippings_id, s.status, c.country
FROM shippings as s, customers as c
WHERE s.custumer = c.customer_id;

SELECT s.shippings_id, s.status, c.country, c.first_name, c.last_name
FROM shippings s
JOIN customers c
ON s.customer = c.customer_id;
JOIN orders o
ON o.customer_id = c.customer_id;

CREATE TABLE addresses (
    address_id int primary key,
    customer_id int,
    city varchar(256) not null,
    zip_code varchar(16) not null,
    street varchar(256) not null,
    number int

    unique(customer_id, city, zip_code, street, number),
    foreign key(customer_id) references customers(customer_id)
);