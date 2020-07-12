SELECT player_id, device_id
FROM (SELECT player_id, device_id, RANK() OVER(PARTITION BY player_id ORDER BY event_date) rank
    FROM Activity) AS temp
WHERE temp.rank = 1
