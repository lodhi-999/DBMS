# Write your MySQL query statement below
with H as (select num, count(num) as repetations from MyNumbers 
group by num
order by num)

select ifnull(max(num), null) as num  from H 
where repetations = 1
