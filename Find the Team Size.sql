SELECT employee_id, COUNT(team_id) OVER(PARTITION BY team_id ORDER BY team_id) team_size
FROM Employee

--OR

-- SELECT employee_id, COUNT(team_id) OVER(PARTITION BY team_id) team_size
-- FROM Employee
-- ORDER BY employee_id
