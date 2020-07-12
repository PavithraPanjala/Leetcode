-- SELECT activity_date day, COUNT(DISTINCT user_id) active_users
-- FROM Activity
-- WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
-- GROUP BY activity_date

-- OR

select activity_date as day,count(distinct user_id) as active_users
from activity
where datediff(day,activity_date,'2019-07-27') between 0 and 29
group by activity_date;
