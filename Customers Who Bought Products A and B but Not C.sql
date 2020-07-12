-- SELECT customer_id, customer_name
-- FROM (SELECT o.customer_id, customer_name, SUM(CASE WHEN product_name = 'A' THEN 1
--                      WHEN product_name = 'B' THEN 2
--                        WHEN product_name = 'C' THEN 4
--                         ELSE 0 END) AS NUM
--     FROM Orders o
--     JOIN Customers c  ON o.customer_id = c.customer_id
--     GROUP BY o.customer_id, customer_name) AS temp
-- WHERE temp.num = 3
-- ORDER BY customer_id

-- OR

SELECT o.customer_id, customer_name
FROM Orders o
JOIN Customers c  ON o.customer_id = c.customer_id
GROUP BY o.customer_id, customer_name
HAVING SUM(CASE WHEN product_name = 'A' THEN 1 ELSE 0 END) > 0
AND SUM(CASE WHEN product_name = 'B' THEN 1 ELSE 0 END) > 0
AND SUM(CASE WHEN product_name = 'C' THEN 1 ELSE 0 END) = 0
ORDER BY customer_id
