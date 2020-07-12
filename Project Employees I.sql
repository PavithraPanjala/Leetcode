--experience_years AS FLOAT isn't working
SELECT DISTINCT project_id, ROUND(AVG(CAST(experience_years AS NUMERIC)) OVER(PARTITION BY project_id),2) average_years
FROM Project P
LEFT JOIN Employee E ON E.employee_id = P.employee_id
