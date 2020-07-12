WITH CTE AS(
    SELECT employee_id
    FROM Employees
    WHERE manager_id = 1 AND employee_id != 1

    UNION ALL

    SELECT E.employee_id
    FROM CTE c
    JOIN Employees e ON c.employee_id = e.manager_id
)

SELECT employee_id
FROM CTE
ORDER BY employee_id
OPTION (MAXRECURSION 3);
