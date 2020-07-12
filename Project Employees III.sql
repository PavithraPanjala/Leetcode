SELECT project_id, employee_id
FROM (SELECT project_id, e.employee_id, DENSE_RANK() OVER(PARTITION BY project_id ORDER BY experience_years DESC) exp
FROM Project p
JOIN Employee e ON e.employee_id = p.employee_id) AS temp
WHERE temp.exp = 1
