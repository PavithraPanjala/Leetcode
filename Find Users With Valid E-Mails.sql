SELECT *
FROM Users
WHERE mail LIKE '[A-Za-z]%@leetcode.com' 
    AND mail NOT LIKE '%[^_0-9a-zA-Z.-]%@leetcode.com'