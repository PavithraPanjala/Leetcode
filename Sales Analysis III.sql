SELECT S.product_id, max(product_name) product_name
FROM Product P
JOIN Sales S
ON P.product_id = S.product_id
GROUP BY S.product_id
HAVING max(sale_date) <= '2019-03-31'
AND min(sale_date) >= '2019-01-01'
