SELECT followee as follower, count( DISTINCT follower) num
FROM follow
WHERE followee IN (SELECT DISTINCT follower
FROM follow)
GROUP BY followee
