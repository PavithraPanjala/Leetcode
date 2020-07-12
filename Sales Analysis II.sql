SELECT buyer_id
FROM Sales s
JOIN Product p ON p.product_id = s.product_id
GROUP BY s.buyer_id
HAVING SUM (CASE WHEN product_name = 'S8' THEN 1 ELSE 0 END) > 0 AND
    SUM (CASE WHEN product_name = 'iPhone' THEN 1 ELSE 0 END) = 0

--OR

-- (SELECT buyer_id
-- FROM Sales s
-- JOIN Product p ON p.product_id = s.product_id
-- WHERE product_name = 'S8')

-- EXCEPT

-- (SELECT buyer_id
-- FROM Sales s
-- JOIN Product p ON p.product_id = s.product_id
-- WHERE product_name = 'iPhone')
