CREATE TABLE IF NOT EXISTS raw_sales_cleaned (
    order_id VARCHAR(50),
    customer_id VARCHAR(50),
    product_category VARCHAR(100),
    product_price DECIMAL(10,2),
    quantity INT,
    order_date DATE,
    region VARCHAR(50),
    payment_method VARCHAR(50),
    delivery_days INT,
    is_returned TINYINT(1),
    customer_rating DECIMAL(3,1),
    discount_percent DECIMAL(5,2),
    revenue DECIMAL(12,2)
);


INSERT INTO raw_sales_cleaned (
    order_id,
    customer_id,
    product_category,
    product_price,
    quantity,
    order_date,
    region,
    payment_method,
    delivery_days,
    is_returned,
    customer_rating,
    discount_percent,
    revenue
)
SELECT
    order_id,
    customer_id,
    product_category,
    CAST(product_price AS DECIMAL(10,2)),
    CAST(quantity AS SIGNED),
    STR_TO_DATE(order_date, '%d-%m-%Y'),
    region,
    payment_method,
    CAST(delivery_days AS SIGNED),
    CAST(is_returned AS BINARY),
    CAST(customer_rating AS DECIMAL(3,1)),
    CAST(discount_percent AS DECIMAL(5,2)),
    CAST(revenue AS DECIMAL(12,2))
FROM temp_raw_sales;

