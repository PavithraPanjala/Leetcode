SELECT
    ISNULL(
        (SELECT DISTINCT Salary
        FROM Employee
        ORDER BY Salary DESC
        OFFSET 1 ROW
        FETCH NEXT 1 ROW ONLY),
    NULL)as SecondHighestSalary
