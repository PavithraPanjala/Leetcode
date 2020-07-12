WITH CTE AS(SELECT *,
    DENSE_RANK() OVER(PARTITION BY customer_id ORDER BY order_date) AS rank,
    (CASE WHEN order_date = customer_pref_delivery_date THEN 1.0 ELSE 0 END) AS immediate
FROM Delivery)


SELECT ROUND(100*SUM(immediate)/COUNT(DISTINCT customer_id),2) AS immediate_percentage
FROM CTE
WHERE rank = 1

-- OR

-- SELECT ROUND(100*SUM(immediate)/COUNT(DISTINCT customer_id),2) AS immediate_percentage
-- FROM (
--     SELECT *,
--         DENSE_RANK() OVER(PARTITION BY customer_id ORDER BY order_date) AS rank,
--         (CASE WHEN order_date = customer_pref_delivery_date THEN 1.0 ELSE 0 END) AS immediate
--     FROM Delivery) AS temp
-- WHERE temp.rank = 1
