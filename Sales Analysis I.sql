SELECT seller_id
FROM (  SELECT seller_id, RANK() OVER(ORDER BY SUM(price) DESC) as rank
        FROM Sales
        GROUP BY seller_id) price
WHERE price.rank = 1
