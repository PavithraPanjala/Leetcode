SELECT S.product_id, S.year AS first_year, S.quantity, S.price
FROM Sales s
WHERE year IN(SELECT MIN(year) year
FROM Sales S1
WHERE S.product_id = S1.product_id
GROUP BY product_id)

--OR

-- SELECT product_id, first_year, quantity, price
-- FROM (  SELECT product_id, DENSE_RANK() OVER(PARTITION BY product_id ORDER BY year) rank,
--       year first_year, quantity, price
--         FROM Sales) AS temp
-- WHERE rank = 1
