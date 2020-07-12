SELECT name
FROM salesperson sp
WHERE sales_id NOT IN (SELECT sales_id
    FROM orders o
    JOIN company c ON  o.com_id = c.com_id
    WHERE name = 'RED') 
