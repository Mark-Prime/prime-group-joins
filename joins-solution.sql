-- Get all customers and their addresses.
SELECT "first_name", "last_name", "street", "city", "state", "zip", "address_type"
FROM "customers"
    JOIN "addresses" ON "customer_id" = "customers"."id";


-- Get all orders and their line items (orders, quantity and product).
SELECT "order_date", "quantity", "description"
FROM orders
    JOIN line_items ON order_id = orders.id
    JOIN products ON product_id = products.id;


-- Which warehouses have cheetos?
SELECT "warehouse"
FROM warehouse
    JOIN warehouse_product ON warehouse_id = warehouse.id
    JOIN products ON product_id = products.id
WHERE products."description" = 'cheetos';


-- Which warehouses have diet pepsi?
SELECT "warehouse"
FROM warehouse
    JOIN warehouse_product ON warehouse_id = warehouse.id
    JOIN products ON product_id = products.id
WHERE products."description" = 'diet pepsi';


-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "first_name", "last_name", SUM("quantity")
FROM "line_items"
    JOIN "orders" ON "order_id" = "orders"."id"
    JOIN "addresses" ON "address_id" = "addresses"."id"
    JOIN "customers" ON "customer_id" = "customers"."id"
GROUP BY "first_name", "last_name";


-- How many customers do we have?
SELECT COUNT(*)
FROM "customers";


-- How many products do we carry?
SELECT COUNT(*)
FROM products;


-- What is the total available on-hand quantity of diet pepsi?
SELECT COUNT(*)
FROM "warehouse_product"
    JOIN "products" ON "products"."id" = "product_id"
WHERE "products"."description" = 'diet pepsi';