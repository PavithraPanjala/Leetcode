-- SELECT country_name, (CASE
--                     WHEN AVG(weather_state*1.0) <= 15.0 THEN 'Cold' --need to convert to float
--                     WHEN AVG(weather_state*1.0) >= 25.0 THEN 'Hot'
--                     ELSE 'Warm' END) Weather_type
-- FROM Weather w
-- JOIN Countries c ON c.country_id = w.country_id
-- WHERE day BETWEEN '2019-11-01' AND '2019-11-30'
-- GROUP BY c.country_name

--OR

SELECT country_name, (CASE
                    WHEN AVG(CAST(weather_state AS FLOAT)) <= 15.0 THEN 'Cold'
                    WHEN AVG(CAST(weather_state AS FLOAT)) >= 25.0 THEN 'Hot'  
                    ELSE 'Warm' END) Weather_type
FROM Weather w
JOIN Countries c ON c.country_id = w.country_id
WHERE day BETWEEN '2019-11-01' AND DATEADD(DAY, 29, '2019-11-01')
GROUP BY c.country_name
