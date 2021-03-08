SELECT SUM(ISNULL(c.apple_count, 0) + b.apple_count) AS apple_count, 
       SUM(ISNULL(c.orange_count, 0) + b.orange_count) AS orange_count
FROM Boxes b
LEFT JOIN Chests c 
    ON c.chest_id = b.chest_id

--  OR

-- SELECT ISNULL(SUM(c.apple_count), 0) + SUM(b.apple_count) AS apple_count,  --repetitive SUM
--        ISNULL(SUM(c.orange_count), 0) + SUM(b.orange_count) AS orange_count
-- FROM Boxes b
-- LEFT JOIN Chests c 
--     ON c.chest_id = b.chest_id

-- OR

-- SELECT apple_box + ISNULL(apple_chest, 0) AS apple_count, -- ISNULL is mandatory here
--        orange_box + ISNULL(orange_chest, 0) AS orange_count
-- FROM (
--     SELECT SUM(b.apple_count) apple_box, 
--            SUM(b.orange_count) orange_box, 
--            SUM(c.apple_count) apple_chest, 
--            SUM(c.orange_count) orange_chest
--     FROM Boxes b
--     LEFT JOIN Chests c 
--         ON c.chest_id = b.chest_id
--         ) AS A