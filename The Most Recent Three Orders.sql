SELECT name customer_name, o.customer_id, order_id, order_date
FROM Customers c
JOIN (
    SELECT customer_id, order_id, order_date, RANK() OVER(PARTITION BY customer_id ORDER BY order_date DESC) rank
    FROM Orders
    ) AS o
    ON c.customer_id = o.customer_id
WHERE o.rank <= 3
ORDER BY name, customer_id, order_date DESC