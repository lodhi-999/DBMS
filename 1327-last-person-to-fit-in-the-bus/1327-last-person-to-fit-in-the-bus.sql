# Write your MySQL query statement below
with H as  (select * , sum(weight) over(order by turn ) r from Queue),

V as (select last_Value( person_name) over(order by turn rows between unbounded preceding and unbounded following) n from H where r <= 1000)

select distinct n as person_name from V