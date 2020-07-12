-- SELECT Name Customers
-- FROM Customers
-- WHERE Id NOT IN (SELECT CustomerId
--                            FROM Orders)

SELECT Name Customers
FROM Customers C
LEFT JOIN Orders O
ON C.Id = O.CustomerId
WHERE O.Id IS NULL
