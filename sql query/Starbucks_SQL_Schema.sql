-- Starbucks Sales & Revenue Analytics
-- PostgreSQL database schema
-- Project flow: Customers -> Orders -> Revenue

CREATE TABLE customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_name VARCHAR(150),
    email VARCHAR(255),
    city VARCHAR(100),
    state_or_region VARCHAR(100),
    country VARCHAR(100),
    signup_date DATE,
    membership_tier VARCHAR(100)
);

CREATE TABLE orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    order_date DATE,
    product_category VARCHAR(150),
    quantity INTEGER,
    unit_price_usd NUMERIC(12,2),
    order_status VARCHAR(50),
    payment_method VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE revenue (
    revenue_id VARCHAR(50) PRIMARY KEY,
    order_id VARCHAR(50),
    payment_date DATE,
    amount_paid_usd NUMERIC(12,2),
    payment_status VARCHAR(50),
    refund_amount_usd NUMERIC(12,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);


-- Basic verification queries
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM revenue;

-- Relationship structure:
-- customers.customer_id -> orders.customer_id
-- orders.order_id -> revenue.order_id

-- ####database copy###################
-- Example CSV import commands:
-- \copy customers FROM 'path/to/Customers.csv' WITH (FORMAT csv, HEADER true);
-- \copy orders FROM 'path/to/Orders.csv' WITH (FORMAT csv, HEADER true);
-- \copy revenue FROM 'path/to/Revenue.csv' WITH (FORMAT csv, HEADER true);