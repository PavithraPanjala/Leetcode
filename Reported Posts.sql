-- SELECT extra report_reason, COUNT(extra) report_count
-- FROM (SELECT DISTINCT post_id, action_date, action, extra
--     FROM Actions
--     WHERE action_date = DATEADD(day, -1, '2019-07-05') AND action = 'report') AS temp
-- GROUP BY temp.extra

--OR

SELECT extra report_reason, COUNT(DISTINCT post_id) report_count
FROM Actions
WHERE action_date = DATEADD(day, -1, '2019-07-05') AND action = 'report'
GROUP BY extra
