SELECT Request_at Day, ROUND(SUM(Cancel_count)/SUM(Total_count), 2) 'Cancellation Rate'
FROM(
    SELECT Client_Id, Request_at,
        (CASE WHEN Status IN ('cancelled_by_driver', 'cancelled_by_client') THEN 1.0 ELSE 0.0 END) AS Cancel_count,
        1.0 AS Total_count
    FROM Trips) AS t
JOIN Users u ON t.Client_Id = u.Users_Id
WHERE Banned = 'No' 
AND t.Request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY Request_at