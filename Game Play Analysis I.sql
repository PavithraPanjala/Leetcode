-- WITH CTE AS(SELECT player_id, event_date, RANK() OVER(PARTITION BY player_id ORDER BY event_date ASC) Rank
-- FROM Activity)

-- SELECT player_id, event_date as first_login
-- FROM CTE
-- WHERE Rank = 1

-- OR

SELECT player_id, min(event_date) first_login
FROM Activity
GROUP BY player_id
