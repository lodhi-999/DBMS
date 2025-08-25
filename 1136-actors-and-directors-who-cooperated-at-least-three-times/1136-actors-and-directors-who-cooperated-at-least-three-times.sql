# Write your MySQL query statement below
With Ranked as (select *, row_number() over(partition by actor_id,director_id order by actor_id ) as rn from ActorDirector)

select actor_id , director_id from Ranked 
where rn = 3