SELECT DISTINCT title
FROM Content c
JOIN TVProgram p
    ON c.content_id = p.content_id
WHERE kids_content = 'Y'
AND DATEPART(Month, program_date) = 6
AND content_type = 'Movies'