SELECT TOP 1 WITH TIES project_id
FROM Project p
JOIN Employee e ON e.employee_id = p.employee_id
GROUP BY project_id
ORDER BY COUNT(project_id) DESC
