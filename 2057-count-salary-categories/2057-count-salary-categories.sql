# Write your MySQL query statement below
with H as (select * , case when income < 20000 then 'Low Salary'
when income between 20000 and 50000 then 'Average Salary' 
when income > 50000 then 'High Salary' end as SC
from Accounts),


D as (select 'Low Salary' as SC 
union all 
select 'Average Salary' 
union all
select 'High Salary') 

select D.SC category, coalesce(count(H.account_id), 0) accounts_count from D left join H
on D.SC = H.SC 
group by D.SC

