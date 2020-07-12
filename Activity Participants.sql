WITH CTE AS (SELECT activity, COUNT(activity) count
    FROM Friends
    GROUP BY activity)

SELECT activity
FROM CTE
WHERE count > (SELECT MIN(count) FROM CTE)
AND count < (SELECT MAX(count) FROM CTE)
