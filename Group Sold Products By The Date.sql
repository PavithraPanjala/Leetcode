SELECT 
    sell_date, 
    count(product) num_sold, 
    string_agg(product, ',') WITHIN GROUP (ORDER BY product) AS products
FROM (
    SELECT DISTINCT *
    FROM Activities) AS A
GROUP BY sell_date
ORDER BY sell_date