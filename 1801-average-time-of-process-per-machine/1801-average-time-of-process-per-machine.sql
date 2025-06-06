# Write your MySQL query statement below
WITH H AS (
    SELECT machine_id, process_id, timestamp AS start
    FROM Activity
    WHERE activity_type = 'start'
),
V AS (
    SELECT machine_id, process_id, timestamp AS end
    FROM Activity
    WHERE activity_type = 'end'
),
K AS (
    SELECT 
        H.machine_id, 
        H.process_id, 
        V.end - H.start AS G
    FROM H
    JOIN V 
        ON H.machine_id = V.machine_id 
        AND H.process_id = V.process_id
)
SELECT 
    machine_id, 
    ROUND(AVG(G), 3) AS processing_time
FROM K
GROUP BY machine_id;