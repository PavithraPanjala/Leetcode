-- WITH CTE AS
-- (SELECT DISTINCT sub_id
-- FROM Submissions
-- WHERE parent_id IS NULL)

-- SELECT s.sub_id post_id, COUNT(DISTINCT p.sub_id) number_of_comments
-- FROM CTE S
-- LEFT JOIN Submissions P
-- ON S.sub_id = P.parent_id
-- GROUP BY s.sub_id
-- ORDER BY s.sub_id

SELECT DISTINCT S.sub_id post_id,
    COALESCE((SELECT COUNT(DISTINCT sub_id)
            FROM Submissions
            WHERE S.sub_id = parent_id), 0) as number_of_comments
FROM Submissions S
WHERE S.parent_id IS NULL
