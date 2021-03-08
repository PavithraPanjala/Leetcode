SELECT s.Score, (
    SELECT COUNT(DISTINCT Score)
    FROM Scores s1
    WHERE s1.Score >= s.Score
) AS Rank
FROM Scores s
ORDER BY rank 

-- OR

-- SELECT Score, DENSE_RANK() OVER(ORDER BY Score DESC) Rank
-- FROM Scores