SELECT u.name, COALESCE(SUM(r.distance), 0) travelled_distance
FROM Rides r
RIGHT JOIN Users u ON u.id = r.user_id
GROUP BY u.name
ORDER BY travelled_distance DESC, name
