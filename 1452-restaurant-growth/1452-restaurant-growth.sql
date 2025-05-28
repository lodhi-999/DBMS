WITH DailyTotals AS (
    SELECT 
        visited_on,
        SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
),
Filtered AS (
    SELECT 
        visited_on,
        sum(amount) OVER (
            ORDER BY visited_on 
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) as amount ,
        ROUND(AVG(amount) OVER (
            ORDER BY visited_on 
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ), 2) AS average_amount
    FROM DailyTotals
)
SELECT * 
FROM Filtered
WHERE visited_on >= (
    SELECT MIN(visited_on) + INTERVAL 6 DAY 
    FROM Customer
)
ORDER BY visited_on;