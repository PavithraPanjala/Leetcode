SELECT CAST(SUM(TIV_2016) AS FLOAT) AS TIV_2016
FROM insurance i
WHERE (SELECT COUNT(*) FROM insurance i1 WHERE i1.TIV_2015 = i.TIV_2015) > 1
AND (SELECT COUNT(*) FROM insurance i2 WHERE  i2.LAT = i.LAT AND i2.LON = i.LON) = 1
