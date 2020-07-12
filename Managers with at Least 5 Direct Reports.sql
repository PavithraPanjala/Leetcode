SELECT e.Name
FROM Employee e
JOIN Employee m ON e.Id = m.ManagerId
GROUP BY e.Name
HAVING COUNT(m.ManagerId) >= 5
