SELECT login_date, COUNT(user_id) user_count
FROM (
    SELECT MIN(activity_date) login_date, user_id
    FROM Traffic
    WHERE activity = 'login'
    GROUP BY user_id) AS temp
WHERE login_date BETWEEN DATEADD(DAY, -90, '2019-06-30') AND '2019-06-30'
GROUP BY login_date
