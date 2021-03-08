-- SELECT name warehouse_name, SUM(p.volume * units) volume
-- FROM Warehouse w
-- JOIN (SELECT product_id, (Width*Length*Height) AS volume
--         FROM Products) AS p
-- ON w.product_id = p.product_id
-- GROUP BY name

-- OR

SELECT name warehouse_name, SUM((Width*Length*Height) * units) volume
FROM Warehouse w
JOIN Products p
    ON w.product_id = p.product_id
GROUP BY name