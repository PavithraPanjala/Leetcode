WITH Emp AS
(SELECT Name, Salary, DepartmentId,
DENSE_RANK() OVER(PARTITION BY DepartmentId ORDER BY Salary DESC) Rank
FROM Employee)

SELECT D.Name Department, E.Name Employee, Salary
FROM Department D
JOIN Emp E
ON D.Id = E.DepartmentId
WHERE Rank IN (1, 2, 3)
ORDER BY Department, Salary DESC
