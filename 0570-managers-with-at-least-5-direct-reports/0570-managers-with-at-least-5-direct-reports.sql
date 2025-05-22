select a.name from Employee a
join Employee b
on a.id = b.managerID
group by a.name , a.id
having count(b.managerID)>=5