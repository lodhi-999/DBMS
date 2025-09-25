# Write your MySQL query statement below
With unbannedclients as (select * from Users  where banned = 'No' and role = 'client'),
unbanneddrivers as (select * from Users  where banned = 'No' and role = 'driver'),


Grouped as (select b.request_at as Days,  count( case when b.status in ('cancelled_by_driver', 'cancelled_by_client') then b.status end ) as cancels , count(b.status) as totals
from unbannedclients a 
join Trips b
on a.users_id = b.client_id 
join unbanneddrivers c
on c.users_id = b.driver_id
where  b.request_at between '2013-10-01' and '2013-10-03'
group by b.request_at
order by b.request_at)


select Days as Day , round(cancels/totals,2) as 'Cancellation Rate' from Grouped