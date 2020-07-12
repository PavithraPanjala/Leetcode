-- SELECT TOP 1 customer_number
-- FROM (SELECT customer_number, COUNT(customer_number) CT
-- FROM Orders
-- GROUP BY customer_number) AS temp
-- ORDER BY temp.CT DESC

--OR

SELECT TOP 1 customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(customer_number) DESC
