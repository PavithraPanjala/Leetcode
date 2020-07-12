SELECT MAX(num) num
FROM (SELECT num
    FROM my_numbers
    GROUP BY num
    HAVING COUNT(num) = 1) AS t



-- This DOESN'T work, doen't print null even with COALESCE

-- SELECT TOP 1 COALESCE(num, null) num
-- FROM my_numbers
-- GROUP BY num
-- HAVING COUNT(num) = 1
-- ORDER BY num DESC
