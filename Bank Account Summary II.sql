SELECT name, SUM(amount) balance
FROM Transactions t
JOIN Users u ON t.account = u.account
GROUP BY name
HAVING SUM(amount) > 10000