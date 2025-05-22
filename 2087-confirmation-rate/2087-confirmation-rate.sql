WITH H AS (
    SELECT 
        a.user_id, 
        COUNT(CASE WHEN b.action = 'confirmed' THEN b.action END) AS CR, 
        COUNT(CASE WHEN b.action = 'timeout' THEN b.action END) AS NC
    FROM Signups a 
    LEFT JOIN Confirmations b ON a.user_id = b.user_id
    GROUP BY a.user_id
)
SELECT 
    user_id, 
    ROUND(IFNULL(CR / (CR + NC), 0), 2) AS confirmation_rate 
FROM H;