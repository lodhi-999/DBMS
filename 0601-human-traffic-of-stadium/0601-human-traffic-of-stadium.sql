# Write your MySQL query statement below
With Filtered as (select * from Stadium where people >=100),


Rankings as (select id  , row_number() over( order by visit_date asc) as r  ,  visit_date ,  people from Filtered  ),

Groupings as (select id , id - r as grouped , visit_date, people from Rankings)

select  id  , visit_date, people 
from Groupings
where grouped in (select grouped
                    from groupings
                    group by grouped
                    having count(*)>=3)
order by visit_date

 


