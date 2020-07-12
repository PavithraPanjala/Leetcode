-- SELECT Email
-- FROM (  SELECT COUNT(Id) Num, Email
--         FROM Person
--         GROUP BY Email) as stat
-- WHERE Num > 1

--OR

-- SELECT Email
-- FROM Person
-- GROUP BY Email
-- HAVING COUNT(Email) > 1

--OR

SELECT distinct p1.Email from Person p1
INNER JOIN Person p2
ON p1.Email = p2.Email
WHERE p1.Id <> p2.Id;
