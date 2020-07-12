SELECT ROUND(ISNULL(AVG(CAST(count AS FLOAT)),0), 2) AS average_sessions_per_user
FROM (SELECT  user_id, COUNT(DISTINCT session_id) count
FROM Activity
WHERE activity_date BETWEEN dateadd(day,-29,'2019-07-27 ') AND '2019-07-27' --DATEADD FUNCTION
GROUP BY user_id) AS temp
