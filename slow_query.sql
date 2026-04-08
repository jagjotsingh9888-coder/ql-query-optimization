EXPLAIN ANALYZE
SELECT 
    customer_name,
    SUM(amount) as total
FROM large_orders
WHERE EXTRACT(YEAR FROM order_date) = 2024
AND status = 'completed'
GROUP BY customer_name
ORDER BY total DESC;
