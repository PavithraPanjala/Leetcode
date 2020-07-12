SELECT
    (CASE
        WHEN id % 2 != 0 AND id != count THEN id+1
        WHEN id % 2 != 0 AND id = count THEN id
        ELSE id-1
    END) as id,
    student
FROM seat,
    (SELECT COUNT(*) count
    FROM seat) as seat_count
ORDER BY id
