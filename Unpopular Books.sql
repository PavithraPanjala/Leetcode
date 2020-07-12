DECLARE @GetDate DATE = '2019-06-23'

SELECT book_id, name
FROM Books
WHERE available_from < DATEADD(MONTH, -1, @GetDate)
AND book_id NOT IN
    (SELECT book_id
    FROM Orders
    WHERE dispatch_date > DATEADD(YEAR, -1, @GetDate)
    GROUP BY book_id
    HAVING SUM(quantity) >= 10)

-- OR

-- SELECT book_id, name
-- FROM (SELECT b.book_id, b.name, COALESCE(SUM(o.quantity), 0) quantity, b.available_from
--     FROM Books b
--     LEFT JOIN Orders o ON b.book_id = o.book_id
--     AND (o.dispatch_date > DATEADD(YEAR, -1, @GetDate))
--     GROUP BY b.name, b.book_id, b.available_from) AS temp
-- WHERE temp.available_from < DATEADD(MONTH, -1, @GetDate)
-- AND temp.quantity < 10

-- OR

-- SELECT book_id, name
-- FROM (SELECT b.book_id, b.name, COALESCE(SUM(o.quantity), 0) quantity, b.available_from
--     FROM Books b
--     LEFT JOIN Orders o ON b.book_id = o.book_id
--     AND (o.dispatch_date BETWEEN DATEADD(YEAR, -1, '2019-06-23') AND '2019-06-23')
--     GROUP BY b.name, b.book_id, b.available_from) AS temp
-- WHERE temp.available_from NOT BETWEEN DATEADD(MONTH, -1, '2019-06-23') AND '2019-06-23'
-- AND temp.quantity < 10
