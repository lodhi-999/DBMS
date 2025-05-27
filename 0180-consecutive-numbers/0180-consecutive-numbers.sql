# Write your MySQL query statemen
with H as (select id ,num , lead(num) over(order by id) x , lead(num, 2) over(order by id) y from Logs )

select  distinct num ConsecutiveNums  from H
where num - x = 0 and x- y = 0

