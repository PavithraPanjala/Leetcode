SELECT TOP 1 question_id survey_log
FROM (SELECT question_id, COUNT(answer_id) ans
    FROM survey_log
    GROUP BY question_id) AS t
ORDER BY t.ans DESC
