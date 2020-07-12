SELECT w2.Id
FROM weather w1
JOIN weather w2 ON DATEDIFF(day, w1.RecordDate, w2.RecordDate) = 1
WHERE w2.Temperature > w1.Temperature
