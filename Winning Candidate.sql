-- SELECT Name
-- FROM (SELECT TOP 1 CandidateId, Name, COUNT(CandidateId) count
-- FROM Vote V
-- JOIN Candidate C ON C.id = V.CandidateId
-- GROUP BY CandidateId, Name
-- ORDER BY count DESC) as Winner

OR

; WITH CTE AS
(SELECT TOP 1 CandidateId, COUNT(1) Votes
FROM Vote
GROUP BY CandidateId
ORDER BY Votes DESC)

SELECT C.Name
FROM CTE V JOIN Candidate C
ON V.CandidateId = C.Id
