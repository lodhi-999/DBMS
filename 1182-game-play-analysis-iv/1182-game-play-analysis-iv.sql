WITH first_login AS (
    
    SELECT player_id, MIN(event_date) AS first_login_date
    FROM Activity
    GROUP BY player_id
),
consecutive_logins AS (
  
    SELECT DISTINCT a.player_id
    FROM Activity a
    JOIN first_login f ON a.player_id = f.player_id
    WHERE a.event_date = DATE_ADD(f.first_login_date, INTERVAL 1 DAY)
)

SELECT 
    ROUND(COUNT(DISTINCT c.player_id) / COUNT(DISTINCT f.player_id), 2) AS fraction
FROM first_login f
LEFT JOIN consecutive_logins c ON f.player_id = c.player_id;
