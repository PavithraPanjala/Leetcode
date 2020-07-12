SELECT id,
    (CASE
        WHEN p_id IS NULL THEN 'Root'
        WHEN p_id IS NOT NULL AND id IN (
            SELECT DISTINCT p_id
            FROM tree) THEN 'Inner'
        ELSE 'Leaf'
    END) AS Type
FROM tree

 --OR

-- SELECT id,
--     (CASE
--         WHEN p_id IS NULL THEN 'Root'
--         WHEN id NOT IN (
--             SELECT DISTINCT p_id
--             FROM tree
--             WHERE p_id IS NOT NULL) THEN 'Leaf'
--         ELSE 'Inner'
--     END) AS Type
-- FROM tree
