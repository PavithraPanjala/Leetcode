WITH CTE AS(SELECT p.product_id, u.units, CAST((u.units * p.price) AS FLOAT)  as total
FROM Prices p
JOIN UnitsSold u ON p.product_id = u.product_id AND u.purchase_date BETWEEN p.start_date AND p.end_date)

SELECT product_id, ROUND(SUM(total)/SUM(units), 2) as average_price
FROM CTE
GROUP BY product_id
