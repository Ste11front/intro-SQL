-- Programiz Online SQL Editor

-- SELECT age
-- FROM customers 

-- SELECT DISTINCT item
-- FROM orders; -- ';' Separa dal successivo

-- SELECT DISTINCT country
-- FROM customers

-- SELECT DISTINCT item, amount
-- FROM orders
-- ORDER BY amount DESC; -- DESC = Descending, di default è ascendente

-- SELECT first_name, last_name
-- FROM customers
-- ORDER BY last_name, first_name;

-- SELECT DISTINCT item, amount
-- FROM orders
-- ORDER BY amount DESC
-- LIMIT 3;

-- SELECT * -- '*' = Tutto
-- FROM customers
-- WHERE NOT (age > 24 OR country = 'USA') -- (...) Indica ordine operazioni
-- ORDER BY age

-- SELECT *
-- FROM orders
-- WHERE amount >= 300 AND item != 'Keyboard' != Significa diverso 

-- SELECT *
-- FROM orders
-- WHERE item in ('Keyboard', 'Mouse')

-- SELECT DISTINCT country
-- FROM customers

-- SELECT COUNT(*)
-- FROM customers 

-- SELECT COUNT(DISTINCT country)
-- FROM customers

-- SELECT COUNT(*)
-- FROM customers
-- WHERE country = 'UK'

-- SELECT COUNT(*)
-- FROM shippings
-- WHERE lower(status) = 'pending'

-- SELECT AVG(age) -- AVG = Average
-- FROM customers;

-- SELECT MAX(age)
-- FROM customers;

-- SELECT MIN(age)
-- FROM customers;

-- SELECT MIN(age), MAX(age), (MAX(age) - MIN(age)) as Diff -- as come valore dato (Diff)
-- FROM customers

-- SELECT country, COUNT(*) as Value
-- FROM customers 
-- GROUP BY country;

-- SELECT country, AVG(age) as Value
-- FROM customers
-- GROUP BY country;

-- SELECT item, SUM(amount)
-- FROM orders
-- GROUP BY item;

SELECT customer_id, AVG(amount), MAX(amount)
FROM orders
GROUP BY customer_id
ORDER BY AVG(amount) DESC
LIMIT 3