# Write your MySQL query statement below
with H as (select * , lag( temperature ) over(order by recordDate) as previousDatetemp ,
lag( recordDate  ) over(order by recordDate) as previousDate
from Weather )


select id from H 
where temperature - previousDatetemp > 0 and  DATEDIFF(recordDate, previousDate) = 1 and previousDate is not null and
previousDatetemp is not null