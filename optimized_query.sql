
CREATE INDEX idx_orders_date 
ON large_orders(order_date);

CREATE INDEX idx_orders_status 
ON large_orders(status);

CREATE INDEX idx_orders_date_status 
ON large_orders(order_date, status);

EXPLAIN ANALYZE
SELECT 
    customer_name,
    SUM(amount) as total
FROM large_orders
WHERE order_date >= '2024-01-01'
AND order_date < '2025-01-01'
AND status = 'completed'
GROUP BY customer_name
ORDER BY total DESC;
