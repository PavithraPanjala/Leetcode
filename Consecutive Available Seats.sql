SELECT seat_id
FROM (SELECT seat_id, free,
        LAG(free,1) OVER(ORDER BY seat_id) prev_free,
        LEAD(free,1) OVER(ORDER BY seat_id) next_free
    FROM cinema) AS temp
WHERE (free = 1 AND prev_free = 1)
OR (free = 1 AND next_free = 1)
