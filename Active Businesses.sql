SELECT business_id
FROM (SELECT *, AVG(occurences) OVER(PARTITION BY event_type) AS avg
     FROM events
     ) e
WHERE occurences > avg
GROUP BY business_id
HAVING COUNT(business_id) > 1
