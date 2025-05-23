# Write your MySQL query statement below
with H as (select b.contest_id, count(b.user_id) as T   from Users a join Register b
on a.user_id = b.user_id
group by b.contest_id)

select contest_id, round((T/ (select count(distinct user_id) from Users)) *100, 2)  percentage from H
order by percentage desc, contest_id

