-- SELECT DISTINCT student_id, course_id, grade
-- FROM (SELECT student_id, course_id, grade, RANK() OVER(PARTITION BY student_id ORDER BY grade DESC, course_id ASC) rank
--     FROM Enrollments) AS temp
-- WHERE rank = 1
-- ORDER BY student_id

-- OR

SELECT *
FROM (SELECT TOP 1 WITH TIES student_id, course_id, grade
    FROM Enrollments
    ORDER BY  RANK() OVER(PARTITION BY student_id ORDER BY grade DESC, course_id)) AS temp
ORDER BY student_id
