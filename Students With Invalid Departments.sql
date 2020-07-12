SELECT id, name
FROM Students
WHERE department_id NOT IN (
    SELECT id
    FROM Departments)

--OR

-- SELECT s.id, s.name
-- FROM Students s
-- LEFT JOIN Departments d
-- ON d.id = s.department_id
-- WHERE d.id IS NULL
