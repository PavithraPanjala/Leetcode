SELECT TOP 1 FB.id, COUNT(*) num
FROM(
    SELECT accepter_id id FROM request_accepted
    UNION ALL
    SELECT requester_id id FROM request_accepted
) AS FB
GROUP BY FB.id
ORDER BY COUNT(*) DESC
