WITH CTE AS(SELECT o.customer_id, MONTH(order_date) month, YEAR(order_date) year, sum(o.quantity * p.price) AS spent
FROM Product p
JOIN Orders o ON p.product_id = o.product_id
GROUP BY o.customer_id, MONTH(order_date), YEAR(order_date))


SELECT s.customer_id, c.name
FROM customers c
JOIN CTE s ON s.customer_id = c.customer_id
WHERE s.month in (6,7) AND s.year = 2020 AND s.spent >= 100
GROUP BY s.customer_id, c.name
HAVING COUNT(s.customer_id) = 2