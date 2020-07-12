WITH CTE AS (SELECT viewer_id, view_date, COUNT(DISTINCT article_id) count
             FROM Views
             GROUP BY viewer_id, view_date)

SELECT DISTINCT viewer_id id
FROM CTE
WHERE count > 1
