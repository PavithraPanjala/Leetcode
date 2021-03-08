SELECT company_id, employee_id, employee_name,
    ROUND(
        CASE 
            WHEN highest > 1000 AND highest < 10000 THEN Salary * (1-0.24)  -- can use 0.76 like below query
            WHEN highest > 10000 THEN Salary * (1-0.49)
            ELSE Salary
        END, 0) AS salary
FROM (
    SELECT * , MAX(Salary) OVER(PARTITION BY company_id ORDER BY company_id) AS highest
    FROM Salaries) AS h
    
-- OR

-- SELECT s.company_id, employee_id, employee_name,
--     ROUND(
--         CASE 
--             WHEN highest > 1000 AND highest < 10000 THEN Salary * 0.76 
--             WHEN highest > 10000 THEN Salary * 0.51
--             ELSE Salary
--         END, 0) AS salary
-- FROM Salaries s
-- JOIN (
--     SELECT company_id, MAX(Salary) AS highest
--     FROM Salaries
--     GROUP BY company_id) AS h
-- ON s.company_id = h.company_id