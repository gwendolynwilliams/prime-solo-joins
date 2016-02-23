--1. Get all customers and their addresses.
SELECT customers.first_name, customers.last_name, addresses.street, addresses.city, addresses.state, addresses.zip
FROM customers
JOIN addresses ON customers.id = addresses.id;


--2. Get all orders and their line items.
SELECT *
FROM orders
JOIN line_items ON orders.id = line_items.order_id;


--3. Which warehouses have cheetos?
SELECT warehouse.warehouse, products.description 
FROM warehouse
JOIN warehouse_product ON warehouse.id = warehouse_product.warehouse_id
JOIN products ON warehouse_product.product_id = products.id
WHERE description = 'cheetos';


--4. Which warehouses have diet pepsi?
SELECT warehouse.warehouse, products.description 
FROM warehouse
JOIN warehouse_product ON warehouse.id = warehouse_product.warehouse_id
JOIN products ON warehouse_product.product_id = products.id
WHERE description = 'diet pepsi';


--5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT customers.first_name, customers.last_name, count(orders.id)
from customers
JOIN addresses ON customers.id = addresses.customer_id
JOIN orders ON addresses.id = orders.address_id
GROUP BY customers.first_name, customers.last_name;

--6. How many customers do we have?
SELECT COUNT(id) FROM customers;


--7. How many products do we carry?
SELECT COUNT(id) FROM products;


--8. What is the total available on-hand quantity of diet pepsi?
SELECT sum(warehouse_product.on_hand)
FROM warehouse_product
JOIN products ON products.id = warehouse_product.product_id
WHERE products.description = 'diet pepsi';