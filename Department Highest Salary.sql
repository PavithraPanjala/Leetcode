With Emp as
(SELECT Name, Salary, DepartmentId,
RANK() OVER (PARTITION BY DepartmentId ORDER BY Salary DESC) as Rank
FROM Employee)

SELECT D.Name Department, E.Name Employee, Salary
FROM Department D
JOIN Emp E
ON E.DepartmentId = D.Id
WHERE E.Rank = 1
