SELECT title AS results
FROM (SELECT TOP 1 m.title
FROM Movie_Rating mr
JOIN Movies m ON mr.movie_id = m.movie_id
WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY m.movie_id, m.title
ORDER BY  avg(1.0 * mr.rating) DESC, title ASC) AS r1 --avg convert int to float

UNION ALL

SELECT name as results
FROM(SELECT TOP 1 u.name
FROM Movie_Rating mr
JOIN Users u ON u.user_id = mr.user_id
GROUP BY mr.user_id, u.name
ORDER BY count(u.user_id) DESC, u.name ASC)
as r2
