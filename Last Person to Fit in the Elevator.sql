SELECT TOP 1 Q.person_name
FROM (  SELECT person_name, sum(weight) over(order by turn asc) sum
        FROM Queue) as Q
WHERE Q.sum <= 1000
ORDER BY Q.sum DESC
