SELECT Id, Month, Salary
FROM (SELECT Id, Month, SUM(Salary) OVER(PARTITION BY Id ORDER BY Month ROWS 2 PRECEDING) Salary,
            ROW_NUMBER() OVER(PARTITION BY Id ORDER BY Month DESC) Month_no
        FROM Employee) AS temp
WHERE temp.Month_no > 1
ORDER BY Id, Month DESC
