WITH CTE AS
    (SELECT e.student_id, student_name, exam_id, score, DENSE_RANK() OVER(PARTITION BY exam_id ORDER BY score) lowest,
            DENSE_RANK() OVER(PARTITION BY exam_id ORDER BY score DESC) highest
    FROM Exam e
    JOIN Student s ON e.student_id = s.student_id)

SELECT DISTINCT student_id, student_name
FROM CTE
WHERE student_id NOT IN (SELECT student_id FROM CTE WHERE lowest = 1 OR highest = 1)
ORDER BY student_id

--OR

-- WITH CTE AS
--     (SELECT *, DENSE_RANK() OVER(PARTITION BY exam_id ORDER BY score) lowest,
--             DENSE_RANK() OVER(PARTITION BY exam_id ORDER BY score DESC) highest
--     FROM Exam )

-- SELECT DISTINCT c.student_id, student_name
-- FROM CTE c
-- JOIN Student s ON c.student_id = s.student_id
-- WHERE c.student_id NOT IN (SELECT student_id FROM CTE WHERE lowest = 1 OR highest = 1)
-- ORDER BY c.student_id
